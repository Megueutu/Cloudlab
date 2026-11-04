variable "region" {
  description = "AWS region where the lab is created."
  type        = string
  default     = "us-east-1" # change to the region you chose in stage 0
}

variable "lab_name" {
  description = "Name of this lab, used in tags and resource names."
  type        = string
  default     = "01-s3-private"
}
