module "vpc" {
   source="./modules/Network/vpc"
   vpc = var.vpc
   environment = var.environment  
}

module "igw" {
    source = "./modules/Network/igw"
    igw_name = var.igw_name
    vpc_id = module.vpc.vpc_id[0]
    environment = var.environment    
}

module "public_subnets" {
    source = "./modules/Network/subnets/public-subnets"
    vpc_id = module.vpc.vpc_id[0]
    public_subnets = var.public_subnets
    environment = var.environment
}

module "private_subnets" {
    source = "./modules/Network/subnets/private-subnets"
    vpc_id = module.vpc.vpc_id[0]
    private_subnets = var.private_subnets
    environment = var.environment
}

module "nat_gws" {
    source = "./modules/Network/nat"
    environment = var.environment
    public_subnets = module.public_subnets.public_subnets_id
}

module "public_route_tables" {
    source = "./modules/Network/routes/public-route-table"
    environment = var.environment
    internet_gateway_id = module.igw.igw_id
    public_subnets = module.public_subnets.public_subnets_id
    public_subnet_route_tables = var.public_subnet_route_tables    
    vpc_id = module.vpc.vpc_id[0]
}

module "private_route_tables" {
    source = "./modules/Network/routes/private-route-table"
    environment = var.environment
    private_subnets = module.private_subnets.private_subnets_id
    nat_gw_id = module.nat_gws.nat_gw_id
    private_subnet_route_tables = var.private_subnet_route_tables
    vpc_id = module.vpc.vpc_id[0]
}

