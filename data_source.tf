
data "aws_caller_identity" "my_id" {}
data "aws_availability_zones" "aws_AZs" {}
data "aws_region" "current" {}

data "aws_vpcs" "my_vpcs" {
  filter {
    name   = "is-default"
    values = ["true"]
  }
}

data "aws_subnets" "my_default_vpc_subnets_ids" {
  filter {
    name   = "vpc-id"
    values = data.aws_vpcs.my_vpcs.ids
  }
}

data "aws_vpc" "default" {
  default = true
}

data "aws_ami" "Amazon_Linux_2_latest" {
  owners      = ["137112412989"]
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-*-x86_64-gp2"]
  }
}




output "my_default_vpc_id" {
  value = data.aws_vpc.default.id
}

output "data_aws_caller_identity" {
  value = data.aws_caller_identity.my_id.account_id
}

output "data_aws_availability_zones" {
  value = data.aws_availability_zones.aws_AZs.names
}

output "data_aws_region_name" {
  value = data.aws_region.current.name
}

output "data_aws_region_description" {
  value = data.aws_region.current.description
}

output "data_aws_vpcs" {
  value = data.aws_vpcs.my_vpcs.ids
}

output "my_default_vpc_subnets_ids" {
  value = data.aws_subnets.my_default_vpc_subnets_ids.ids
}
