### Getting Started

format
```
block_name resource_type resource_name {
    // arguments for resource in key value format
}
```

example
```
resource "aws_instance" "webserver"{
    ami = "ami-3458ewufhge38"
    instance_type = "t2.mmicro"
}
```

```
resource "aws_s3_bucket" "data"{
    bucket = "webserver-bucket-org-2007"
    acl = "private"
}
```