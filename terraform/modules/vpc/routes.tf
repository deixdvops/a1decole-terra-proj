
# Resource: aws_route_table
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table

resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }
  tags =merge(var.common_tags,{
    Name = format("%s-%s-%s-pub-route", var.common_tags["owner"], var.common_tags["teams"], var.common_tags["environment"])
  })
}

resource "aws_route_table" "private-route-tables" {
  count = length(var.availability_zones)
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = element(aws_nat_gateway.natgws.*.id, count.index)
  }

  tags =merge(var.common_tags,{
    Name = format("%s-%s-%s-private-route-tables-${count.index +1}", var.common_tags["owner"], var.common_tags["teams"], var.common_tags["environment"])
  })
}






