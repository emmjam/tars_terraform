# Output all the things needed by the other components
output "obs-sg-id" {
  value = module.obs.security_group_id
}
