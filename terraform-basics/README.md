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