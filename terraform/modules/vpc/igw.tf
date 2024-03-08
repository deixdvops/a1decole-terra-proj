resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  tags = merge(var.common_tags, {
    Name = format("%s-%s-%s-igw", var.common_tags["owner"], var.common_tags["teams"], var.common_tags["environment"])
  })
}
