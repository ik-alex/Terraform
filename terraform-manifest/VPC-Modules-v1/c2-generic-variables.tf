# Input variables

#AWS region
variable "aws_region" {
  description = "Region in which AWS resources to be created"
  type = string
  default = "us-east-1"
}