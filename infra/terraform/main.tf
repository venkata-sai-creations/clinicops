module "vpc" {
  source = "./modules/vpc"

  prefix = "clinicops"

  public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]

  # azs can be left empty to allow AWS provider to pick available AZs
  enable_nat = false
}
