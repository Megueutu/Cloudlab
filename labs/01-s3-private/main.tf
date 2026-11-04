# The core of this lab is yours to write.
#
# Goal: a private S3 bucket, encrypted, with public access blocked.
#
# Questions to answer before writing each block:
#   - Which resource creates the bucket, and why is the name globally unique?
#   - Which separate resource blocks public access, and which four settings does it have?
#   - Which resource turns on encryption at rest, and which algorithm will you pick?
#   - Do you need versioning for this lab? What does it cost you?
#   - What will `terraform plan` show you, and what should it NOT show?
#
# Read the docs for the aws provider (aws_s3_bucket and the resources that
# start with aws_s3_bucket_) and write the blocks by hand.
