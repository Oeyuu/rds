locals {
  acc_id       = "410948603335"
  company_name = "teclify"
  prefix       = "${local.company_name}-sandbox2-${local.acc_id}"
  app          = "rds"
  full_prefix  = "${local.prefix}-${local.app}"

}

locals {
  name    = "rds-oracle"
  region  = "eu-central-1"

  vpc_cidr = "10.204.92.0/25"
  azs      = slice(data.aws_availability_zones.available.names, 0, 3)

  tags = {
    Name       = local.name
    Example    = local.name
    Repository = "https://github.com/terraform-aws-modules/terraform-aws-rds"
  }
}
