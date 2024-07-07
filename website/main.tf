data "aws_codestarconnections_connection" "codestar" {
    name = var.codestarconnection_name
}

module "app" {
  source = "git::https://github.com/cdguru/aws_terraform_eb_web_module.git//elasticbeanstalk-app?ref=v1.0"
  name = "${var.name}-${terraform.workspace}"
  description = var.description

  tags = {
    Terraform   = "true"
    Environment = "${terraform.workspace}"
    Workload    = "${terraform.workspace}_${var.name}_elasticbeanstalk_app"
  }
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.8.1"

  name = "${var.name}-${terraform.workspace}"
  cidr = var.cidr

  azs             = var.azs_list
  public_subnets  = var.pub_sn_list

  enable_vpn_gateway    = var.enable_vpn_gateway
  enable_dns_hostnames  = var.enable_dns_hostnames
  enable_dns_support    = var.enable_dns_support

  map_public_ip_on_launch = var.map_public_ip_on_launch

  tags = {
    Terraform   = "true"
    Environment = "${terraform.workspace}"
    Workload    = "${terraform.workspace}_${var.name}_vpc"
  }
}

module "environment" {
  #source = "../modules/elasticbeanstalk-env"
  source = "git::https://github.com/cdguru/aws_terraform_eb_web_module.git//elasticbeanstalk-env?ref=v1.0"


  name = "${var.name}-${terraform.workspace}"
  app_name = module.app.name
  description = var.description

  solution_stack_name = var.solution_stack_name
  ec2_key_name = var.ec2_key_name

  ec2_enable_spot = var.ec2_enable_spot
  ec2_instance_types = var.ec2_instance_types

  asg_min_size = var.asg_min_size
  asg_max_size = var.asg_max_size

  vpc_id = module.vpc.vpc_id
  subnet_id = module.vpc.public_subnets
  elb_subnet_id = module.vpc.public_subnets

  tags = {
    Terraform   = "true"
    Environment = "${terraform.workspace}"
    Workload    = "${terraform.workspace}_${var.name}_elasticbeanstalk_env"
  }  
}

module "pipeline" {
  #source = "../modules/elasticbeanstalk-pipeline"
  source = "git::https://github.com/cdguru/aws_terraform_eb_web_module.git//elasticbeanstalk-pipeline?ref=v1.0"

  name = "${var.name}-${terraform.workspace}"

  elasticbeanstalk_app_name = module.app.name
  elasticbeanstalk_env_name = module.environment.name

  full_repository_id = var.full_repository_id
  repository_branch = var.repository_branch

  codestarconnection_arn = data.aws_codestarconnections_connection.codestar.arn

  tags = {
    Terraform   = "true"
    Environment = "${terraform.workspace}"
    Workload    = "${terraform.workspace}_${var.name}_pipeline"
  }  

}
