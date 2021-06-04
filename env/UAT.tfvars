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

public_security_groups = [
    {
        name = "public-security-group-1"
        description = "This is public security group"
    }
]

public_security_group_rules = [
    {
        from_port   = "22"
        to_port     = "22"
        protocol    = "tcp"
    },
    {
        from_port   = "80"
        to_port     = "80"
        protocol    = "tcp"
    }
]

PublicInstances = [
    {
        name                        = "JumpServer"
        ami                         = "ami-0123b531fc646552f" #Ubuntu Server 18.04 LTS (HVM)
        availability_zone           = "ap-south-1a"
        instance_type               = "t2.micro"
        key_name                    = "demo-new-server"
        associate_public_ip_address = true
        user_data                   = "./modules/Ec2/user-data/install_apache2.sh"
        monitoring                  = false
        disable_api_termination     = false
        volume_type                 = "gp2"
        volume_size                 = 16
    }
]

private_security_groups = [
    {
        name = "private-security-group-1"
        description = "This is private security group"
    },

    {
        name = "private-security-group-2"
        description = "This is private security group"
    }
]


private_security_group_rules = [
    {
        from_port   = "22"
        to_port     = "22"
        protocol    = "tcp"
    },
    {
        from_port   = "80"
        to_port     = "80"
        protocol    = "tcp"
    }
]

PrivateInstances = [ 
    {
        name                        = "app-server-1"
        ami                         = "ami-0123b531fc646552f" #Ubuntu Server 18.04 LTS (HVM)
        availability_zone           = "ap-south-1a"
        instance_type               = "t2.micro"
        key_name                    = "demo-new-server"
        associate_public_ip_address = false
        user_data                   = "./modules/Ec2/user-data/install_apache2.sh"
        monitoring                  = false
        disable_api_termination     = false
        volume_type                 = "gp2"
        volume_size                 = 16
    },

    {
        name                        = "app-server-2"
        ami                         = "ami-0123b531fc646552f" #Ubuntu Server 18.04 LTS (HVM)
        availability_zone           = "ap-south-1b"
        instance_type               = "t2.micro"
        key_name                    = "demo-new-server"
        associate_public_ip_address = false
        user_data                   = "./modules/Ec2/user-data/install_apache2.sh"
        monitoring                  = false
        disable_api_termination     = false
        volume_type                 = "gp2"
        volume_size                 = 16
    }
]