module "vpc" {
  source = "./modules/vpc"
  prefix = "clinicops"
  public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
  enable_nat = false
}

module "ecr" {
  source = "./modules/ecr"
  name   = "clinicops-app"
  tags   = { environment = "dev" }
}
