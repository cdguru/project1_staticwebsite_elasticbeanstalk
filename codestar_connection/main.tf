resource "aws_codestarconnections_connection" "codestar" {
  name          = var.name
  provider_type = var.provider_type
}