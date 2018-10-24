/*

Lifecycle Policy Evaluation Rules

The lifecycle policy evaluator is responsible for parsing the plaintext JSON and applying it to the images in the specified repository. The following rules should be noted when creating a lifecycle policy:
    An image is expired by exactly one or zero rules.
    An image that matches the tagging requirements of a rule cannot be expired by a rule with a lower priority.
    Rules can never mark images that are marked by higher priority rules, but can still identify them as if they haven't been expired.
    The set of rules must contain a unique set of tag prefixes.
    Only one rule is allowed to select untagged images.
    Expiration is always ordered by pushed_at_time, and always expires older images before newer ones.
    When using the tagPrefixList, an image is successfully matched if all of the tags in the tagPrefixList value are matched against any of the image's tags.
    With countType = imageCountMoreThan, images are sorted from youngest to oldest based on pushed_at_time and then all images greater than the specified count are expired.
    With countType = sinceImagePushed, all images whose pushed_at_time is older than the specified number of days based on countNumber are expired.
*/

data "template_file" "ecr_lifecycle_policy_main" {
  template = "${file("${path.module}/templates/ecr_lifecycle_policy_main.json.tmpl")}"

  # Presuming that we will at some point begin to template this file.
  vars = {}
}
