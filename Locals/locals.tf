variable "ProjectName" {
  description = "Provide the name of the Project"
}
variable "aws_account_number" {
  default = "12458712212"
  description = "AWS Account name"
}

locals {
  bucketname = "${var.ProjectName}-${var.aws_account_number}"
}
output "s3bucket_name" {
  value = local.bucketname
}