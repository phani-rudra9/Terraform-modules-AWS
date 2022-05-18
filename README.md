# Terraform-modules-AWS
Terraform modules for vpc, subnets, nat gateways, route tables, eip's, Security_Groups, Ec2 Instances, user_data.

# commands:-
# 1.Initialize the terraform script run
```sh
terraform init
```

# 2. Validate the sceript using
``` sh
terraform validate
```
# 3. For debugging use TRACE which is the most verbose and is the default with TF_LOG is set to something other than a  log level name
#  To persist the log output you can set TF_LOG_PATH=./log/terraform-crash.log
``` sh
export TF_LOG=TRACE  
export TF_LOG_PATH=./log/terraform-crash.log
```

# 2.Plan the script to make sure what exactly it's creating and redirect the output to JSON
```sh
terraform plan --out=outputs.json --var-file=./env/UAT.tfvars
```
# 3.Apply the terraform  
```sh
terraform apply "outputs.json"
```
# 4.Note
```sh
Soon I will add each resource
```
