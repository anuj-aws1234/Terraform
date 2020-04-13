#create a random id


resource "random_id" "tf_bucket_id" {
  byte_length = 2
}

resource "aws_s3_bucket" "mybucket" {
  bucket = "${var.project_name}-${random_id.tf_bucket_id.dec}"
  acl    = "private"

  force_destroy = true

  tags {
     name = "tf_bucket"
}
}
