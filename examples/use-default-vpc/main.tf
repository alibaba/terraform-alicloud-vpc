variable "region" {
  default = "cn-hangzhou"
}
provider "alicloud" {
  region = var.region
}

###################################
# Data sources to get default VPC #
##################################
data "alicloud_vpcs" "default" {
  is_default = true
}

locals {
  default_vpc_cidr_block = data.alicloud_vpcs.default.vpcs.0.cidr_block
}
module "vpc" {
  source = "../../"
  region = var.region

  vpc_id = data.alicloud_vpcs.default.ids.0

  availability_zones = ["cn-hangzhou-e", "cn-hangzhou-f"]
  vswitch_cidrs      = [cidrsubnet(local.default_vpc_cidr_block, 8, 10), cidrsubnet(local.default_vpc_cidr_block, 8, 11), cidrsubnet(local.default_vpc_cidr_block, 8, 12)]

  vswitch_tags = {
    Project    = "Secret"
    Endpoint   = true
    DefaultVpc = true
  }
}
