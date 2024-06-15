# TERRAFORM STATE

terraform.tfstate is created after ```terraform apply``` 
[] Its a JSON file that maps real world infrastructure resource definition in confguration files and its used as single source of truth when commands related to terraform plan or apply are run.

if you run terraform plan , tf will refresh memory and compares against configuration file, when configuration file and state file are in sync , no changes are applied to tf apply. 

state file also keeps track of all the attributes and dependencies so be able to maintain right state even when configuration file has been changed.

eg: if a resource is removed , how does tf know which resource/file to delete ? - it uses state


For larger infrastructures , computing state can be very slow process and tf state can be used as a record of truth without reconciling , ```terraform plan --refresh=false``` , where tf wont refresh state and rely on state file.

State must be shared between all members of team working on building data and hence can be also stored at a remote location.
eg: S3 , Hashicorp console , google cloud storage.

## Considerations

State file may hold a lot of sensitive information like private IPs or password