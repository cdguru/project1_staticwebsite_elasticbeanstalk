#
# Application
#
name        = "StaticWebTest"
description = "Project1 Static web site PROD"
#
# VPC
#
cidr                    = "172.24.0.0/16"
azs_list                = ["us-east-1a","us-east-1b"]
pub_sn_list             = ["172.24.1.0/24","172.24.2.0/24"]
map_public_ip_on_launch = true  # Just for testing, this is not recommended.
#
# Elasticbeanstalk Environment
#
solution_stack_name = "64bit Amazon Linux 2023 v4.2.0 running PHP 8.2"
ec2_key_name        = "my-aws-key" # CHANGE ME !!!!
ec2_enable_spot     = false
ec2_instance_types  = "t3.small"
asg_min_size        = 2
asg_max_size        = 4
#
# Codepipeline
#
codestarconnection_name = "Github_Connection"
full_repository_id      = "cdguru/simple-static-site"
repository_branch       = "master"