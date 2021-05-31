resource "aws_instance" "PublicInstance" {
  count = length(var.PublicInstances)
  ami = lookup(var.PublicInstances[count.index], "ami")
  availability_zone = lookup(var.PublicInstances[count.index], "availability_zone")
  instance_type = lookup(var.PublicInstances[count.index], "instance_type")
  key_name = lookup(var.PublicInstances[count.index], "key_name")
  subnet_id = var.public_subnetid
  associate_public_ip_address = lookup(var.PublicInstances[count.index], "associate_public_ip_address")
  user_data = file(lookup(var.PublicInstances[count.index], "user_data"))
  vpc_security_group_ids = [var.public_sg_id] 
	tags = {
		Name = format("${var.environment}-%s", lookup(var.PublicInstances[count.index], "name"))
		Environment = var.environment
	    Terraformed = "True"
	}
}