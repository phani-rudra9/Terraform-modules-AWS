region = "ap-south-1"

environment = "UAT"

vpc = [
    {
        cidr = "172.30.0.0/16"
        enable_dns_support = "true"
        enable_dns_hostnames = "true"
        name = "test-vpc"
        tenancy = "default"
    },

    {
        cidr = "192.168.0.0/16"
        enable_dns_support = "true"
        enable_dns_hostnames = "true"
        name = "test1-vpc"
        tenancy = "default"  
    }
]

public_subnets = [
        {
            cidr = "172.30.1.0/24"
            name = "public-subnet-1a"
            availability_zone = "ap-south-1a" 
            map_public_ip_on_launch = "true"
        },
                
        {
            cidr = "172.30.2.0/24"
            name = "public-subnet-1b"
            availability_zone = "ap-south-1b" 
            map_public_ip_on_launch = "true"
        }

]

private_subnets = [
        {
            cidr = "172.30.100.0/24"
            name = "private-subnet-1a"
            availability_zone = "ap-south-1a" 
        },
                
        {
            cidr = "172.30.101.0/24"
            name = "private-subnet-1b"
            availability_zone = "ap-south-1b" 
        }
]

igw_name = "vpc-1-igw"

public_subnet_route_tables = [
    {
        name = "public-route-table"
    }
]

private_subnet_route_tables = [
    {
        name = "private-route-table-1a"
    },

    {
        name = "private-route-table-1b"
    },
    
]
