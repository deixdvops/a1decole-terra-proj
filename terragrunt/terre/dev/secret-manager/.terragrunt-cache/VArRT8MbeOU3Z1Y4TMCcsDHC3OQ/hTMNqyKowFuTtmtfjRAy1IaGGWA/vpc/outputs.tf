output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnets" {
  value = aws_subnet.public-subnet.*.id
}

output "public_cidrs" {
  value = aws_subnet.public-subnet.*.cidr_block
}

output "private_subnets" {
  value = aws_subnet.private-subnet.*.id
}

output "private_cidrs" {
  value = aws_subnet.private-subnet.*.cidr_block
}