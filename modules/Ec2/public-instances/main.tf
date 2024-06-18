resource "aws_instance" "PublicInstance" {
    count = length(var.PublicInstances)
    ami = data.aws_ami.ubuntu.id
    availability_zone = lookup(var.PublicInstances[count.index], "availability_zone")
    instance_type = lookup(var.PublicInstances[count.index], "instance_type")
    key_name = lookup(var.PublicInstances[count.index], "key_name")
    subnet_id = var.public_subnetid[count.index % length(var.public_subnetid)]
    associate_public_ip_address = lookup(var.PublicInstances[count.index], "associate_public_ip_address")
    user_data = file(lookup(var.PublicInstances[count.index], "user_data"))
    vpc_security_group_ids = [var.public_sg_id]
    monitoring = lookup(var.PublicInstances[count.index], "monitoring")
    disable_api_termination = lookup(var.PublicInstances[count.index], "disable_api_termination")
  root_block_device  {
    volume_type = lookup(var.PublicInstances[count.index], "volume_type")
    volume_size = lookup(var.PublicInstances[count.index], "volume_size")
  }
	tags = {
		Name = format("${var.environment}-%s", lookup(var.PublicInstances[count.index], "name"))
		Environment = var.environment
	  Terraformed = "True"
	}
    provisioner "local-exec" {
    command = "echo ${element(self.*.public_ip, count.index)} >> hosts.txt"
  }
}

# resource "null_resource" "private_ips" {
#   count = length(var.PublicInstances)
#   provisioner "local-exec" {
#     command = "echo ${element(aws_instance.PublicInstance.*.public_ip, count.index)} >> hosts.txt"
#   }
# }

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
}

