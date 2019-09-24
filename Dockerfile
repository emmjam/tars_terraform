# !!! WARING !!!
# If you are making changes to *yum* please reflect those changes in packer scripts.
# Docker image should be aligned with base AMI for Amazon Linux.
# After the changes new Docker image should be uploaded to ECR: https://jenkins2.motdev.org.uk/job/Amazon_Linux/job/ECR/job/Build/
# and new Base AMI should be created: https://jenkins2.motdev.org.uk/job/Amazon_Linux/job/Build_Amazon_Linux_Base_AMI/
# Location of packer script: https://gitlab.motdev.org.uk/webops/mot-packer/blob/master/amzn-base-factory.json
# Location of packer bootstrap script: https://gitlab.motdev.org.uk/webops/mot-packer/blob/master/files/amazon-linux/bootstrap-base.sh
FROM amazonlinux:2018.03

LABEL dvsa.tars.aws.os="Amazon Linux" \
      dvsa.tars.aws.ami-type="dvsatars-builder"

RUN yum upgrade -y \
    && yum update -y \
    && yum install -y \
      aws-apitools-as \
      aws-apitools-common \
      aws-apitools-ec2 \
      aws-apitools-elb \
      aws-apitools-mon \
      cronie-anacron \
      gcc \
      wget \
      git \
      htop \
      initscripts \
      java-1.7.0-openjdk \
      jq \
      curl \
      lsof \
      mlocate \
      ncdu \
      puppet-agent \
      rpm-build \
      strace \
      tree \
      vim-enhanced \
      yum-plugin-s3-iam \
      policycoreutils \
      policycoreutils-python \
      selinux-policy \
      selinux-policy-targeted \
      libselinux-utils \
      setools \
      setools-console \
      && yum clean all 

ADD entrypoints /etc/rc.d/init.d

RUN curl -s https://releases.hashicorp.com/terraform/0.12.2/terraform_0.12.2_linux_amd64.zip -o terraform_0.12.2_linux_amd64.zip \
    && unzip terraform_0.12.2_linux_amd64.zip \
    && mv terraform /bin \
    && chmod +x /bin/terraform