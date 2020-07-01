# AWS S3 Website

This module creates and configures an S3 bucket for hosting a website.

## Variables

| Name            | Type                                   | Required | Default    | Description                           |
| --------------- | -------------------------------------- | -------- | ---------- | ------------------------------------- |
| domain          | string                                 | ✓        |            | domain the bucket is hosting for      |
| index_document  | string                                 |          | index.html | index object when one isn't specified |
| error_document  | string                                 |          | error.html | error object served                   |
| policy          | string                                 |          | null       | IAM policy attached to the bucket     |
| routing_rules   | string                                 |          | null       | Routing rules JSON                    |
| logging_enabled | bool                                   |          | false      | Do you want to enable access logging  |
| logging_config  | object({bucket=string, prefix=string}) |          | null       | access log configuration              |
| tags            | map(string)                            |          | {}         | tags applied to the resources         |

## Outputs

| Name                | Description                                           |
| ------------------- | ----------------------------------------------------- |
| website_bucket_id   | ID of the bucket                                      |
| website_bucket_arn  | ARN of the bucket                                     |
| website_bucket_name | Name of the bucket                                    |
| website_bucket_dns  | DNS name used to access the bucket                    |
| logging_bucket_id   | ARN of the logging (if managed by the module)         |
| logging_bucket_arn  | ARN of the logging (if managed by the module)         |
| logging_bucket_name | Name of hte logging bucket (if managed by the module) |

## Examples

### Create bucket using the default settings

This includes no logging configuration, routing rules or policies

```terraform
module "website_bucket" {
    source = "."
    domain = "my-website.com"
}
```

### Create bucket with logging

```terraform
module "website_bucket" {
    source          = "."
    domain          = "my-website.com"
    logging_enabled = true
}
```

### Create bucket with logging that is stored in a pre-existing bucket

```terraform
module "website_bucket" {
    source          = "."
    domain          = "my-website.com"
    logging_enabled = true
    logging_conifg  = {
        bucket = "my_bucket_id"
        prefix = "website_logs/"
    }
}
```
