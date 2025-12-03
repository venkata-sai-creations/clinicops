module "vpc" {
  source = "./modules/vpc"

  prefix = "clinicops"

  public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]

  # optional: azs can be left empty and provider will pick AZs
  enable_nat = false
}

# you can add more module calls here later (eg. ECR, EKS)
