
[1]. Terraform manages infrastructure on multiple cloud platforms with a declarative syntax.

[2]. This is achieved using terraform providers.

[3]. Providers enable managing 3rd party platforms via their APIs.

[4]. a few examples
  - Cloud Flare
  - DNS
  - Data Dog
  - Grafana
  - VM Ware
  - GCP
  - AWS
  - MySQL
  - PostGreSQL
  - Mongo DB
and many more.

[5]. Teraform uses HCL (Hashi Corp langugae) where you can declare a state and tf will create a draft plan to get to the target state from current state.

[6]. Terraform works in 3 phases , init , plan, apply.

[7]. Every object that tf manages is called a Resource, Tf manages lifecycle of the resources.
  - Provisioning
  - Configuration
  - decommissioning

[8]. Terraform can ensure that the entire infrastructure is always in defined state at all times.

[9]. Tf can read attributes of existing infrastrcuture componenets by configuring data sources. This can be used for configuring other resources within tf.

[10]. 
