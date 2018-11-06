#!/bin/bash
# vim: set syntax=sh tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab :

# -u          :: Fail on unbounded variable usage
# -o pipefail :: Report failures that occur elsewhere than just the last command in a pipe
set -uo pipefail

# Just for logging. Because rsyslog is not running before userdata.
log_file='/tmp/bootstrap.log';

function log() {
  echo -e "$(date) ${1}" \
    | tee -a "${log_file}";
}

function error() {
  echo -e "$(date) ERROR: ${1}" \
    | tee -a "${log_file}";
  exit 1;
};

export aws="$(which aws || echo '/usr/bin/aws')";
export curl="$(which curl || echo '/usr/bin/curl')";

log '=== Starting Bootstrap Script ===';

# Instance ID begets all things...
log 'Retrieving Instance ID from Metadata';
instance_id="$(${curl} -s http://169.254.169.254/latest/meta-data/instance-id)";
if [ ${?} -ne 0 ]; then
  error "Failed to retrieve Instance ID";
fi
log "Instance ID: ${instance_id}";

# Get Current AWS Region in order to do anything useful...
log 'Retrieving Instance Identity Document from Metadata';
instance_identity_document="$(${curl} -s http://169.254.169.254/latest/dynamic/instance-identity/document)";
if [ ${?} -ne 0 ]; then
  error "${curl} -s http://169.254.169.254/latest/dynamic/instance-identity/document";
else
  log 'Instance Identity Document Retrieved';

  region="$(echo "${instance_identity_document}" | jq -r .region)";

  if [ ${?} -ne 0 ]; then
    error 'jq: Instance Identity Document could not be parsed for current Region';
  else
    log "Region retrieved: ${region}";
  fi;

  # Make it available to the AWS cli; who needs to specify the region manually on every single call(?)
  export AWS_DEFAULT_REGION="${region}";
fi;

# Now we have the Instance ID and the Region, we can get everything else...

# Get the Autoscaling Group Name - it's a bit dirty but it works.
asg_name="$(${aws} autoscaling describe-auto-scaling-instances \
  --instance "${instance_id}" \
  --output json \
  | jq -r .AutoScalingInstances[0].AutoScalingGroupName)";

if [ ${?} -ne 0 ]; then
  error 'Failed to retrieve the autoscaling group name for this instance';
fi;

# Get the Launching LifeCycle Hook Name for this ASG (Making the assumption there's only one hook!)
lifecycle_hook_name="$(${aws} autoscaling describe-lifecycle-hooks \
  --auto-scaling-group-name "${asg_name}" \
  --output json \
  | jq -r '.LifecycleHooks[] | select(.LifecycleTransition=="autoscaling:EC2_INSTANCE_LAUNCHING") | .LifecycleHookName')";

if [ ${?} -ne 0 ]; then
  error "Failed to retrieve lifecycle hook name for the autoscaling:EC2_INSTANCE_LAUNCHING transition for the autoscaling group named: ${asg_name}";
fi;

##
# Preliminary data retrieval complete. On with the show...
##

# Install puppet5
log 'Installing puppet-code';

yum install -y puppet-code 2>&1 \
  | tee -a "${log_file}" \
  || error 'Failed to install puppet code RPM';

# Load puppet env variables
log 'Sourcing puppet-agent environment variables';

# We can't trust puppet's profile script not to reference unbound variables
set +u

source /etc/profile.d/puppet-agent.sh \
  || error 'Failed to source puppet-agent environment variables';

# But we can trust ourselves...
set -u;

# Run Puppet
puppet_env='dvsatars';

log 'Running puppet apply...';
puppet apply \
  --environment "${puppet_env}" \
  /etc/puppetlabs/code/environments/${puppet_env}/manifests/site.pp 2>&1 \
  | tee -a "${log_file}" \
  || error 'Puppet Apply Failed';

# set serverspec test variables
nodetype="$(facter nodetype)";
spec_passed=1
syntax_ok=1

# Run Serverspec tests in a subshell
(
  cd /etc/puppetlabs/code/environments/serverspec

  file_list=($(find . -name \*_spec.rb | grep "common\|${nodetype}"))

  echo "Nodetype: ${nodetype}"

  # Check syntax of each file
  for file_name in "${file_list[@]}"
  do
    echo -n "Checking $file_name: "
    ruby -c ${file_name} || syntax_ok=0
  done;

  # If all files OK, then run tests
  if [ "${syntax_ok}" -eq 1 ]; then
    /opt/puppetlabs/puppet/bin/rake || spec_passed=0
  fi
)

# If tests passed or skipped then we're good to go; otherwise we abandon...
if [ ${spec_passed} -eq 1 ]; then
  # If we haven't died by now - we're safe to become a healthy instance
  log 'Completing the ASG Lifecycle Action to bring this instance into live service';
  ${aws} autoscaling complete-lifecycle-action \
    --lifecycle-action-result CONTINUE \
    --instance-id "${instance_id}" \
    --lifecycle-hook-name "${lifecycle_hook_name}" \
    --auto-scaling-group-name "${asg_name}" \
    && log '=== Bootstrap Complete ===' \
    || error 'Failed to complete lifecycle hook';

else
  log 'Completing the ASG Lifecycle Action to abandon this instance';
  ${aws} autoscaling complete-lifecycle-action \
    --lifecycle-action-result ABANDON \
    --instance-id "${instance_id}" \
    --lifecycle-hook-name "${lifecycle_hook_name}" \
    --auto-scaling-group-name "${asg_name}" \
    && log '=== Bootstrap ABANDON ===' \
    || error 'Failed to complete lifecycle hook';

fi
