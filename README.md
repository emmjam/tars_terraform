# TARS terraform

**INFO**
------
TARS Terraform code Git Repository

**DOCKER Support**
------
From within the puppet repo:
```
[tf_version=<action>] docker-compose -f docker-compose.yaml run bash-tf
```

**TF Bootstrap**
------
```
bash -x terraform.sh --bootstrap -p tars -a apply --region eu-west-1
```

**TF Commands Examples**
------
From within a component folder:
```
bash -x ../../bin/terraform.sh --action <action> --project tars --environment <environment> --component <component> --region eu-west-1
```

