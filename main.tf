resource "aws_s3_bucket" "this" {
  bucket = "${var.domain}-website"
  acl    = "public-read"
  policy = var.policy
  tags   = var.tags

  website {
    index_document = var.index_document
    error_document = var.error_document
    routing_rules  = var.routing_rules
  }

  // if we are logging to an externally managed bucket
  dynamic "logging" {
    for_each = (var.logging_enabled == true && var.logging_config != null) ? [var.logging_config] : []
    content {
      target_bucket = lookup(logging.value, "bucket")
      target_prefix = lookup(logging.value, "prefix")
    }
  }

  // if we are logging to a bucket managed within this module
  dynamic "logging" {
    for_each = (var.logging_enabled == true && var.logging_config == null) ? [] : []
    content {
      target_bucket = aws_s3_bucket.logging.id
      target_prefix = ""
    }
  }
}

resource "aws_s3_bucket" "logging" {
  count  = var.logging_enabled == true && var.logging_config == null ? 1 : 0
  bucket = "${var.domain}-access-logs"
  acl    = "log-delivery-write"
  tags   = var.tags
}