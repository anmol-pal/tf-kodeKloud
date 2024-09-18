main.tf [Main configuration file containing resource definition]

variables.tf [contains variable declarations]

output.tf [contains output from resources]

provider.tf [contains provider definition]



### Working with variables

Variables are declared in var.tf  and extrapolated using var.variableName
```
variable "length"{
    default = 2
    type = number [Optional]
    description = "length of petname" [Optional]
}
```

types of variables 
    - string  - "/root/pet.txt"
    
    - number  - 1
    
    - bool    - true/false
    
    - any     - Default Value
    
    - map     - pet1 = cat
                pet2 = dog
                
    - lists   - ["cat", "dog"]
    
    - object  - Complex Data structure
    
    - tuple   - Complex Data structure


Example of map 
variables.tf
```
variable file-content{
    type = map
    default = {
        "st1" = "we love this"
        "st2" = "We love animals"
    }
}
```
main.tf
```
resource local_file my-pet{
    filename = "/root/pets.txt"
    content = var.file-content[st1]
}
```

#### Set
Duplicates not allowed
variables.tf
```
variable "prefix" {
    default = ["Mr", "Mrs", "Sir"]
    type = set(string)
}
```

#### Objects
variables.tf
```
variable "bella"{
    type = object({
        name = string
        color = string
        age = number
        food = list(string)
        favourite_pet = bool
    })
}
```

#### Tuples
variables.tf
```
    type = tuple ([string, number, bool])
    default = ["cat", 7, true]
```

### Other ways of passing variables 
#### Commandline
```
terraform apply -var "filename=/abc/edf.txt" -var "content=abcedf" ... 
```

#### Environment Variables
Export variable followed by TF_VAR
```
export TF_VAR_filename="/abc/edf.txt"
export TF_VAR_content="abcedf"
...
...
terraform apply
```
#### Variable definition files
terraform.tfvars
```
filename="/abc/edf.txt"
content="abcedf"
$ terraform apply
```

if file name is different than **terraform.tfvars** then pass the variable file as an arg
```
terraform apply -var-file=variable.tfvars
```

### Variable Definition Precedence
If more than one of the above ways are used to assign variables , terraform follows 
```
environment variables < terraform.tfvars < *.auto.tfvars (alphabetical order) < -var or -var-file
```

### Resource Attribute Refernces
```
use via ${resource_type.resource_name.attribute}
```
