resource "aws_instance" "PrivateInstance" {
  count = length(var.PrivateInstances)
  ami = lookup(var.PrivateInstances[count.index], "ami")
  availability_zone = lookup(var.PrivateInstances[count.index], "availability_zone")
  instance_type = lookup(var.PrivateInstances[count.index], "instance_type")
  key_name = lookup(var.PrivateInstances[count.index], "key_name")
  subnet_id = var.private_subnetid
  associate_public_ip_address = lookup(var.PrivateInstances[count.index], "associate_public_ip_address")
  user_data = file(lookup(var.PrivateInstances[count.index], "user_data"))
  vpc_security_group_ids = [var.private_sg_id] 
	tags = {
		Name = format("${var.environment}-%s", lookup(var.PrivateInstances[count.index], "name"))
		Environment = var.environment
	    Terraformed = "True"
	}
}