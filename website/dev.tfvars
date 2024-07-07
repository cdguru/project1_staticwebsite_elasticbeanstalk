#
# Application
#
name        = "StaticWebTest"
description = "Project1 Static web site DEV"
#
# VPC
#
cidr                    = "172.23.0.0/16"
azs_list                = ["us-east-1a"]
pub_sn_list             = ["172.23.0.0/24"]
map_public_ip_on_launch = true  # Just for testing, this is not recommended.
#
# Elasticbeanstalk Environment
#
solution_stack_name = "64bit Amazon Linux 2023 v4.2.0 running PHP 8.2"
ec2_key_name        = "my-aws-key" # CHANGE ME !!!!
ec2_enable_spot     = true
ec2_instance_types  = "t3.micro"
asg_min_size        = 1
asg_max_size        = 1
#
# Codepipeline
#
codestarconnection_name = "Github_Connection"
full_repository_id      = "cdguru/simple-static-site"
repository_branch       = "master"