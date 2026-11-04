provider "aws" {
  region = var.region

  # Every resource created by this lab gets these tags automatically.
  default_tags {
    tags = {
      Project   = "cloudlab"
      Lab       = var.lab_name
      ManagedBy = "terraform"
    }
  }
}
