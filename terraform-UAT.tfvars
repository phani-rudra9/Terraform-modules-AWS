region = "us-east-1"
environment = "UAT"


vpc = [
        {
            cidr = "10.3.0.0/16"
            enable_dns_support = "true"
            enable_dns_hostnames = "true"
            name = "test-vpc"
            tenancy = "default"

        },
        {
            cidr = "10.2.0.0/16"
            enable_dns_support = "true"
            enable_dns_hostnames = "true"
            name = "test1-vpc"
            tenancy = "default"  
        }
    ]


public_subnets = [
        {
            cidr = "10.2.9.0/24"
            name = "public-subnet-1a"
            availability_zone = "us-east-1a" 
            map_public_ip_on_launch = "true"
        },
                
        {
            cidr = "10.2.10.0/24"
            name = "public-subnet-1b"
            availability_zone = "us-east-1b" 
            map_public_ip_on_launch = "true"
        }
    ]


igw = [
     {
        name = "test1-preprod-igw"
        }
    ]

ecr-repo = [
     {
            name = "sample-tf-newman"
            image_tag_mutability = "MUTABLE"
        }
]

aws_ecs_task_definition = [
    {
            family = "sample"
            memory =  512
            cpu    =  256

        }
]

ecs =[
        {
            name = "sample"
            # log_name = "sample"
        }
    ] 