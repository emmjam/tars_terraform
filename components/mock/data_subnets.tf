data "aws_subnet" "tars_backend" {
    for_each = toset(data.terraform_remote_state.base.outputs.subnets_tars_backend)
    id       = each.key
}