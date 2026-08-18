resource "aws_s3_bucket" "data" {
  # bucket is public
  # bucket is not encrypted
  # bucket does not have access logs
  # bucket does not have versioning
  bucket        = "${local.resource_prefix.value}-data"
  region        = "us-west-2"
  acl           = "public-read"
  force_destroy = true
  tags = {
    Name                 = "${local.resource_prefix.value}-data"
    Environment          = local.resource_prefix.value
    git_commit           = "c2fef228753aaa84933737607496454037504394"
    git_file             = "main.tf"
    git_last_modified_at = "2026-08-18 02:50:52"
    git_last_modified_by = "daryl.mensah1@gmail.com"
    git_modifiers        = "daryl.mensah1"
    git_org              = "dmensah-jojo"
    git_repo             = "Github_Actions_Test_Cortex_Cloud"
    yor_name             = "data"
    yor_trace            = "3b188661-4c00-40e7-965d-c6434c432900"
  }
}

resource "aws_s3_bucket_object" "data_object" {
  bucket = aws_s3_bucket.data.id
  region = "us-west-2"
  key    = "customer-master.xlsx"
  source = "resources/customer-master.xlsx"
  tags = {
    Name                 = "${local.resource_prefix.value}-customer-master"
    Environment          = local.resource_prefix.value
    git_commit           = "c2fef228753aaa84933737607496454037504394"
    git_file             = "main.tf"
    git_last_modified_at = "2026-08-18 02:50:52"
    git_last_modified_by = "daryl.mensah1@gmail.com"
    git_modifiers        = "daryl.mensah1"
    git_org              = "dmensah-jojo"
    git_repo             = "Github_Actions_Test_Cortex_Cloud"
    yor_name             = "data_object"
    yor_trace            = "da482eef-ff43-474c-8d0e-2ac617a0d8d5"
  }
}

resource "aws_s3_bucket" "financials" {
  # bucket is not encrypted
  # bucket does not have access logs
  # bucket does not have versioning
  bucket        = "${local.resource_prefix.value}-financials"
  region        = "us-west-2"
  acl           = "private"
  force_destroy = true
  tags = {
    Name                 = "${local.resource_prefix.value}-financials"
    Environment          = local.resource_prefix.value
    git_commit           = "c2fef228753aaa84933737607496454037504394"
    git_file             = "main.tf"
    git_last_modified_at = "2026-08-18 02:50:52"
    git_last_modified_by = "daryl.mensah1@gmail.com"
    git_modifiers        = "daryl.mensah1"
    git_org              = "dmensah-jojo"
    git_repo             = "Github_Actions_Test_Cortex_Cloud"
    yor_name             = "financials"
    yor_trace            = "8c8336cb-755a-4dbe-890a-b7aabbcddd42"
  }

}

resource "aws_s3_bucket" "operations" {
  # bucket is not encrypted
  # bucket does not have access logs
  bucket = "${local.resource_prefix.value}-operations"
  region = "us-west-2"
  acl    = "private"
  versioning {
    enabled = true
  }
  force_destroy = true
  tags = {
    Name                 = "${local.resource_prefix.value}-operations"
    Environment          = local.resource_prefix.value
    git_commit           = "c2fef228753aaa84933737607496454037504394"
    git_file             = "main.tf"
    git_last_modified_at = "2026-08-18 02:50:52"
    git_last_modified_by = "daryl.mensah1@gmail.com"
    git_modifiers        = "daryl.mensah1"
    git_org              = "dmensah-jojo"
    git_repo             = "Github_Actions_Test_Cortex_Cloud"
    yor_name             = "operations"
    yor_trace            = "c8251dc2-6a5a-4a5e-9ac7-beb6b4c5b8ff"
  }

}

resource "aws_s3_bucket" "data_science" {
  # bucket is not encrypted
  bucket = "${local.resource_prefix.value}-data-science"
  region = "us-west-2"
  acl    = "private"
  versioning {
    enabled = true
  }
  logging {
    target_bucket = "${aws_s3_bucket.logs.id}"
    target_prefix = "log/"
  }
  force_destroy = true
  tags = {
    git_commit           = "c2fef228753aaa84933737607496454037504394"
    git_file             = "main.tf"
    git_last_modified_at = "2026-08-18 02:50:52"
    git_last_modified_by = "daryl.mensah1@gmail.com"
    git_modifiers        = "daryl.mensah1"
    git_org              = "dmensah-jojo"
    git_repo             = "Github_Actions_Test_Cortex_Cloud"
    yor_name             = "data_science"
    yor_trace            = "a004f323-b1d4-478a-bd7b-6660fb40f5a4"
  }
}

resource "aws_s3_bucket" "logs" {
  bucket = "${local.resource_prefix.value}-logs"
  region = "us-west-2"
  acl    = "log-delivery-write"
  versioning {
    enabled = true
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = "aws:kms"
        kms_master_key_id = "${aws_kms_key.logs_key.arn}"
      }
    }
  }
  force_destroy = true
  tags = {
    Name                 = "${local.resource_prefix.value}-logs"
    Environment          = local.resource_prefix.value
    git_commit           = "c2fef228753aaa84933737607496454037504394"
    git_file             = "main.tf"
    git_last_modified_at = "2026-08-18 02:50:52"
    git_last_modified_by = "daryl.mensah1@gmail.com"
    git_modifiers        = "daryl.mensah1"
    git_org              = "dmensah-jojo"
    git_repo             = "Github_Actions_Test_Cortex_Cloud"
    yor_name             = "logs"
    yor_trace            = "e1cc3af1-00bf-4fe0-93e8-b3d918ccbb4f"
  }
}
