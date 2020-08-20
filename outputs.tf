// Output the IDs of the ECS instances created

output "vpc_id" {
  description = "The VPC ID"
  value       = local.vpc_id
}

output "vpc_cidr_block" {
  description = "The VPC CIDR Block"
  value       = concat(alicloud_vpc.vpc.*.cidr_block, [""])[0]
}

output "vpc_name" {
  description = "The VPC name"
  value       = concat(alicloud_vpc.vpc.*.name, [""])[0]
}

output "vpc_tags" {
  description = "The VPC tags"
  value       = concat(alicloud_vpc.vpc.*.tags, [{}])[0]
}

output "resource_group_id" {
  description = "The Id of resource group which the instance belongs."
  value       = concat(alicloud_vpc.vpc.*.resource_group_id, [])[0]
}

output "nat_gateway_id" {
  description = "The NAT Gateway Identifier if created"
  value       = concat(alicloud_nat_gateway.default.*.id, [])[0]
}

output "nat_gateway_snat_table_ids" {
  description = "The SNAT table of the NAT Gateway"
  value       = concat(alicloud_nat_gateway.default.*.snat_table_ids, [])[0]
}

output "nat_gateway_dnat_table_ids" {
  description = "The DNAT table of the NAT Gateway"
  value       = concat(alicloud_nat_gateway.default.*.forward_table_ids, [])[0]
}

output "vswitches_ids" {
  description = "List of vswitch ids"
  value       = [for value in alicloud_vswitch.vswitch : value.id]
}

output "vswitches" {
  description = "List of vswitches created"
  value       = [for value in alicloud_vswitch.vswitch: value]
}
