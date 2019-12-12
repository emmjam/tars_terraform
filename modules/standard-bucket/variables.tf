/*

As a sub-resource standardisation module, this module does not
expect to receive any of the standard terraformscaffold variables
for construction. The component or module calling this module will
use those variables to define inputs.

For example, the name parameter expected by this module might be defined
in the following way by a parent module:

  name = "${format(
   "%s-%s-%s-%s-%s-%s",
   var.project,
   var.aws_account_id,
   data.aws_region.current.name,
   var.environment,
   var.component,
   var.module
  )}"

Or like this if the parent is a component:

  name = "${format(
   "%s-%s-%s-%s-%s-%s",
   var.project,
   var.aws_account_id,
   var.region,
   var.environment,
   var.component,
   "purpose"
  )}"

Similarly, any merging of additional tags into a default_tags map variable
should be done when calling this module, this module only expects the "tags"
map that is already fully defined, including the
Name, Environment, Component and Module (optional) tags

*/

variable "name" {
  type        = string
  description = "The name of the bucket"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to the bucket"
}

variable "log_bucket" {
  type        = string
  description = "The name (id) of the S3 bucket used for S3 Bucket Access Logging within the scope of the parent component or module"
}

