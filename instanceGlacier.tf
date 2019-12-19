
resource "aws_s3_bucket" "bucketglacier" {
  bucket = "bucket-galcier-epsi-react"
  acl    = "private"

  tags = {
    Name = "Bucket S3 Glacier"
  }
}
