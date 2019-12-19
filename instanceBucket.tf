
resource "aws_s3_bucket" "bucket" {
  bucket = "bucket-epsi-react"
  acl    = "private"

  tags = {
    Name = "Bucket S3"
  }
  cors_rule {
    allowed_headers = [
      "*",
    ]
    allowed_methods = [
      "PUT",
      "POST",
      "DELETE",
    ]
    allowed_origins = [
      "*",
    ]
    expose_headers  = []
    max_age_seconds = 3000
  }
}
