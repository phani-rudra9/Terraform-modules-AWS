resource "aws_ecr_repository" "ecr-repo" {
  count = length(var.ecr-repo)
  name  = lookup(var.ecr-repo[count.index],"name")
  image_tag_mutability = lookup(var.ecr-repo[count.index],"image_tag_mutability")
  image_scanning_configuration {
    scan_on_push = true
  }
  tags = {
    Environment = var.environment
    created_by = var.created_by
    Terraformed = true
  }    

}
