module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0"

  name = local.name
  cidr = local.vpc_cidr

  azs              = local.azs
  private_subnets  = [for k, v in local.azs : cidrsubnet(local.vpc_cidr, 3, k)]
  database_subnets = [for k, v in local.azs : cidrsubnet(local.vpc_cidr, 3, k + 3)]

  create_database_subnet_group = true

  tags = local.tags
}
