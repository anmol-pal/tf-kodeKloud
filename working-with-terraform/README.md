# Working with state

* to check if syntax is correct without running terraform plan/apply
```
terraform validate
```

* to format code into canonical format
```
terraform fmt
```

* to show current state of infrastructure
```
terraform show
```

* list all providers in tf directory
```
terraform providers
```

* print all output variables
```
terraform output
```

* sync tf to real world infra , chnaged outside of terraform, tf refresh will pickup manual changes and bring it in state file.
This helps determining what is next acions, it will not modify any resources, but will modify the state file.
```
terraform refresh
```

* Tf refresh is also run automatically when ```terraform plan``` or ```terraform apply```  is run , prior to generating an execution plan. 
this can be skipped using ```-refresh=false``` 



## Lifecycle Rules
By deafult tf considers resource to be immutable [i.e. delete an order resource first then create a newer resource ] , on the contrary we might want a latest resource to be created first and then followed by removal of older resource - This type of tasks are managed by life-cycle rules.

* create_before_destroy
```
resource "local_file" "pet"{
    filename = "/root/pets.txt"
    content = "we love pets!"
    file_permission = "0700"
    lifecycle {
        create_before_destroy = true
    }
}
```
* prevent_destroy
To prevent deletion of a resource, it will not work if the corresponding resource block was removed from the configuration file

```
    lifecycle {
        prevent_destroy = true
    }
```

* ignore_changes
  will ignore changes made in tags
```
resource "aws_instace" "webserver" {
    ami = "adwqwwqsdxfgchvjbk"
    instance_type = "t2.micro"
    tags = {
        Name = "Proj1"
    }
    lifecycle = {
        ignore_changes = [
            tags
        ]
    }

}
```

## Data Sources

Its used for read attributes from a resource managed outside of tf, data source is read only

```
data "local_file" "dog" {
    filename = "/root/dog.txt"
}

# Usage

resource "local_file" "pet"{
    filename = "/root/pet.txt"
    content = data.local_file.dog.content
}
```

## Meta Arguments

### count

```
variables.tf
variable "filename"{
    default=[
        "root/pet.txt",
        "root/cat.txt"
        "root/dog.txt"
    ]
}

resource "local_file" "pets"{
    filename = var.filename[count.index]
    count = length(var.filename)
}
```

### for_each - Only works for a set or a list -- Resources are created as a map not a list

```
variables.tf
variable "filename"{
    type = list(string)
    default=[
        "root/pet.txt",
        "root/cat.txt"
        "root/dog.txt"
    ]
}

resource "local_file" "pets"{
    filename = each.value
    for_each = var.filename
}

output "pets" {
    value = local_file.pets
}
-------------OR---------------
variable "filename"{
    default=[
        "root/pet.txt",
        "root/cat.txt"
        "root/dog.txt"
    ]
}

resource "local_file" "pets"{
    filename = each.value
    for_each = toset(var.filename)
}

output "pets" {
    value = local_file.pets
}
```


## Working with specific versions of providers 
Practice specifying versions of tf providers, otherwise always latest may get downloaded and it could run current config out of support.

```
terraform {
    required_providers {
        local = {
            source = "hashicorp/local"
            version = "1.4.0"
        }
    }
}

resource "local_file" "pet"{
    filename = "/root/file.txt"
    content = "abc"
}
```

can also do

```
terraform {
    required_providers {
        local = {
            source = "hashicorp/local"
            version = "> 1.2.0 , != 2.0.0, <2.8.0>"
        }
    }
}
```
