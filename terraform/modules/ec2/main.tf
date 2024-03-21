locals {
  choice_ami_id = var.hardcoded_ami ? var.ami : data.aws_ami.ubuntu.id
}

module "ec2_sg" {
  source                 = "../security_groups"
}

resource "aws_instance" "ec2" {
  ami                    = local.choice_ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  subnet_id              = var.subnet_id
  root_block_device {
    volume_size = var.volume_size
  }
  depends_on = [ "aws_security_group.ec2_sg" ]
  tags = merge(var.tags, {
    Name = format("%s-%s-%s-bastion-host", var.tags["id"], var.tags["environment"], var.tags["project"])
    },
  )
}

