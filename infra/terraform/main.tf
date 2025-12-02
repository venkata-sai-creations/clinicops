resource "random_id" "suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "placeholder" {
  bucket = "clinicops-placeholder-${random_id.suffix.hex}"
  tags = {
    Name = "clinicops-placeholder"
  }
}
