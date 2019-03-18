#!/bin/bash +x
# vim: set syntax=sh tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab :

function log () {
  case $1 in
    "INFO")
      LOG_COLOR="\033[96m";;
    "ERROR")
      LOG_COLOR="\033[31m";;
    "WARN")
      LOG_COLOR="\033[93m" ;;
    "SUCCESS")
      LOG_COLOR="\033[32m" ;;
    *)
      LOG_COLOR="\033[1m" ;;
  esac

  echo -e "$${LOG_COLOR} [$(date)] $${1}: $2\033[0m" | tee -a "/var/log/bootstrap.log"
}

function error () {
  log "ERROR" "$1"
  exit
}

# Python is the best bet to safely escape the log data
# for json consumption. json is a std python lib so 
# minimal dependency requirements
function json_escape () {
    printf '%s' "$1" | python -c 'import json,sys; print(json.dumps(sys.stdin.read()))'
}

export aws="$(which aws || echo '/usr/bin/aws')";
export curl="$(which curl || echo '/usr/bin/curl')";

log '=== Starting Bootstrap Script ===';

# Instance ID begets all things...
log 'INFO' 'Retrieving Instance ID from Metadata';
instance_id="$($${curl} -s http://169.254.169.254/latest/meta-data/instance-id)";
if [ $${?} -ne 0 ]; then
  error "Failed to retrieve Instance ID";
fi
log 'INFO' "Instance ID: $${instance_id}";

# Get Current AWS Region in order to do anything useful...
log 'INFO' 'Retrieving Instance Identity Document from Metadata';
instance_identity_document="$($${curl} -s http://169.254.169.254/latest/dynamic/instance-identity/document)";
if [ $${?} -ne 0 ]; then
  error "$${curl} -s http://169.254.169.254/latest/dynamic/instance-identity/document";
else
  log 'INFO' 'Instance Identity Document Retrieved';

  region="$(echo "$${instance_identity_document}" | jq -r .region)";

  if [ $${?} -ne 0 ]; then
    error 'jq: Instance Identity Document could not be parsed for current Region';
  else
    log 'INFO' "Region retrieved: $${region}";
  fi;

  # Make it available to the AWS cli; who needs to specify the region manually on every single call(?)
  export AWS_DEFAULT_REGION="$${region}";
fi;

# Get the Autoscaling Group Name - it's a bit dirty but it works.
asg_name="$($${aws} autoscaling describe-auto-scaling-instances \
  --instance "$${instance_id}" \
  --output json \
  | jq -r .AutoScalingInstances[0].AutoScalingGroupName)";

if [ $${?} -ne 0 ]; then
  error 'Failed to retrieve the autoscaling group name for this instance';
else
  log 'INFO' "ASG name retrieved: $${asg_name}";
fi;

## Get the Launching LifeCycle Hook Name for this ASG (Making the assumption there's only one hook!)
lifecycle_hook_name="$($${aws} autoscaling describe-lifecycle-hooks \
  --auto-scaling-group-name "$${asg_name}" \
  --output json \
  | jq -r '.LifecycleHooks[] | select(.LifecycleTransition=="autoscaling:EC2_INSTANCE_LAUNCHING") | .LifecycleHookName')";

if [ $${?} -ne 0 ]; then
  error "Failed to retrieve lifecycle hook name for the autoscaling:EC2_INSTANCE_LAUNCHING transition for the autoscaling group named: $${asg_name}";
else
  log 'INFO' "Lifecycle hook name retrieved: $${lifecycle_hook_name}"
fi;

# Prerequisite information gathered - begin bootstrapping

BOOTSTRAP_SUCCESS=1

cd /opt/packer-puppet-masterless

log 'INFO' 'Running puppet to configure environment'

/opt/puppetlabs/bin/puppet apply \
  --verbose \
  --detailed-exitcodes \
  --modulepath='/opt/packer-puppet-masterless/module-0:/opt/packer-puppet-masterless/module-1' \
  --hiera_config='/opt/packer-puppet-masterless/hiera.yaml' \
  /opt/packer-puppet-masterless/manifests/site.pp

case $${?} in
  6|4|1)
    log "ERROR" "Puppet run failed with exit code $${?}"
    BOOTSTRAP_SUCCESS=0 ;;
  *)
    log "INFO" "Puppet run completed" ;;
esac

if [ $${BOOTSTRAP_SUCCESS} -eq 1 ]; then
  log 'SUCCESS' 'Bootstrap complete for nodetype: ${NODETYPE}'
else
  log 'ERROR' 'Bootstrap abandon for nodetype: ${NODETYPE}'
fi

# Sure would be lovely if date could give unix time 
# in milliseconds
timestamp=$(($(date +'%s * 1000 + %-N / 1000000')))
log_data="$(json_escape "$(cat /var/log/cloud-init-output.log)")"

echo """
[
  {
    \"timestamp\": $${timestamp},
    \"message\": $${log_data}
  }
]""" > /var/log/cwl-cloud-init.txt

aws logs create-log-stream \
  --region $${region} \
  --log-group-name ${LOG_GROUP} \
  --log-stream-name $${instance_id}

aws logs put-log-events \
  --region $${region} \
  --log-group-name ${LOG_GROUP} \
  --log-stream-name $${instance_id} \
  --log-events file:///var/log/cwl-cloud-init.txt

log 'INFO' 'Completing lifecycle action'

if [ $${BOOTSTRAP_SUCCESS} -eq 1 ]; then
  $${aws} autoscaling complete-lifecycle-action \
      --lifecycle-action-result CONTINUE \
      --instance-id "$${instance_id}" \
      --lifecycle-hook-name "$${lifecycle_hook_name}" \
      --auto-scaling-group-name "$${asg_name}" \
      || error 'Failed to complete lifecycle hook';
else
  $${aws} autoscaling complete-lifecycle-action \
    --lifecycle-action-result ABANDON \
    --instance-id "$${instance_id}" \
    --lifecycle-hook-name "$${lifecycle_hook_name}" \
    --auto-scaling-group-name "$${asg_name}" \
    || error 'Failed to complete lifecycle hook';
fi
