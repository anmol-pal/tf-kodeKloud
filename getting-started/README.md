### Getting Started

initialise the directory : tf will download and install plugins used within configuration
```
terraform init
terraform init 

Initializing the backend...

Initializing provider plugins...
- Reusing previous version of hashicorp/local from the dependency lock file
- Using previously-installed hashicorp/local v2.5.1

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```
These terraform plugins are distributed by hashicorp and are publically available in terraform registry 
```
registry.terraform.io
```

tf init shows the version of the plugins installed.
tf init is safe command and can be run as many times without impacting infrastructure
plugins are downloaded into a hidden directory <>/.terraform



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