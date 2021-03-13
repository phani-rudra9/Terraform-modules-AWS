# Terraform-modules-vpc-ecr-ecs-taskdef
Terraform modules for vpc, subnets, nat gateways, route tables, eip's
# commands:-
# 1.Initialize the terraform script run
```sh
terraform init
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