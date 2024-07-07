#
# General
variable "name" {
  type = string
  description = "Name of the APP"
}
variable "description" {
  type = string
  description = "A description about our site"
}
variable "codestarconnection_name" {
  type        = string
  description = "Name of our Github Codestar connection"
}
#
# VPC
variable "cidr" {
  type = string
  description = "CIDR to use in the dev VPC"
}
variable "pub_sn_list" {
  type = list(string)
  description = "List of public subnets to create"
}
variable "azs_list" {
  type = list(string)
  description = "List of AZs"
}
variable "enable_vpn_gateway" {
  type = bool
  description = "VPN Gateway"
  default = false
}
variable "enable_dns_hostnames" {
  type = bool
  description = "Dns Hostnames"
  default = true
}
variable "enable_dns_support" {
  type = bool
  description = "Dns Support"
  default = true
}
variable "map_public_ip_on_launch" {
  type = bool
  description = "Automatically assign a public ip to EC2 instance"
  default = false
}
#
# Environment
variable "solution_stack_name" {
  type = string
  description = "The full name of the solution stack"
}
variable "ec2_instance_types" {
  type = string
  description = "IMPORTANT: Comma separated string of ec2 instances to use. Example: t3.large,m5.large"
}
variable "ec2_key_name" {
  type = string
  description = "Name of the key to use in case we need to access the EC2 used in our environemnt"
}
variable "ec2_enable_spot" {
  type = bool
  default = false
  description = "Whether to use SPOT instances or not"
}
variable "asg_min_size" {
  type = number
  description = "The minimum amount of EC2 instances for this Auto Scaling Group"
}
variable "asg_max_size" {
  type = number
  description = "The maximum amount of EC2 instances for this Auto Scaling Group"
}
#
# Codepipeline
variable "full_repository_id" {
  type = string
  description = "The full repo id. Format: <org-name>/<repo-name>"
}
variable "repository_branch" {
  type = string
  description = "The branch for dev env"
}
