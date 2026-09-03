locals {
  ami_id = data.aws_ami.kcdevops.id
  common_tags = {
        Environment = var.environment
        Project     = var.project
        Terraform   = "true"
  }
  # public subnet in 1a AZ
  public_subnet_id = split(",", data.aws_ssm_parameter.public_subent_ids.value)[0]
  bastion_sg_id = data.aws_ssm_parameter.bastion_sg_id.value
}