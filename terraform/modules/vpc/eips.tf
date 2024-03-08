resource "aws_eip" "eks_eips" {
  count = var.common_tags["environment"] == "production" ? length(var.availability_zones) : var.eips
  vpc   = true
  tags = merge(var.common_tags, {
    Name = format("%s-%s-%s-eips-${count.index + 1}", var.common_tags["owner"], var.common_tags["teams"], var.common_tags["environment"])
  })

}

