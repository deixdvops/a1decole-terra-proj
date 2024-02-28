# # Resource: aws_route_table_association
# # https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association

resource "aws_route_table_association" "public-subnet-associations" {
  count = length(var.availability_zones)
  subnet_id = element(aws_subnet.public-subnet.*.id, count.index)
  route_table_id = aws_route_table.public-route-table.id
}

resource "aws_route_table_association" "private-subnet-associations" {
  count = length(var.availability_zones)
  subnet_id = element(aws_subnet.private-subnet.*.id, count.index)
  route_table_id = element(aws_route_table.private-route-tables.*.id, count.index)
}

