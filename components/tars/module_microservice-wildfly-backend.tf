# TODO: We should be using a microservice module for the TARS backend server

# module "wildfly-backend" {
#   source = "../../modules/microservice"

#   name        = "wildfly"
#   project     = "${var.project}"
#   environment = "${var.environment}"
#   component   = "${var.component}"

#   vpc_id             = "${data.terraform_remote_state.base.vpc_id}"
#   availability_zones = "${data.aws_availability_zones.available.names}"

#   subnets_cidrs        = "${var.backend_subnets_cidrs}"
#   subnets_route_tables = ["${data.terraform_remote_state.base.route_table_private_nat}"]

#   lc_ami_id            = "${data.aws_ami.wildfly-back.image_id}"
#   lc_instance_type     = "${lookup(var.wildfly-back,"instance_type")}"
#   lc_user_data         = "${data.template_cloudinit_config.wildfly-back.rendered}"
#   lc_additional_sg_ids = ["${aws_security_group.tars-core-backend.id}"]

#   asg_size_min               = "${lookup(var.wildfly-back,"asg_min_size")}"
#   asg_size_desired_on_create = "${lookup(var.wildfly-back,"asg_min_size")}"
#   asg_size_max               = "${lookup(var.wildfly-back,"asg_max_size")}"
#   asg_load_balancers         = ["${aws_alb.tars-alb-backend-private.id}"]

#   default_tags = "${var.default_tags}"
# }
