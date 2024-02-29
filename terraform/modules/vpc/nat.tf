# # Resource: aws_nat_gateway
# # https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway

resource "aws_nat_gateway" "natgws" {
  count             = var.multiple_nats ? length(var.availability_zones) : 1 
  allocation_id = element(aws_eip.eks_eips.*.id, count.index)
  subnet_id = element(aws_subnet.public-subnet.*.id, count.index)
  tags =merge(var.common_tags,{
    Name = format("%s-%s-%s-nat-${count.index +1}-${element(var.availability_zones, count.index)}", var.common_tags["owner"], var.common_tags["teams"], var.common_tags["environment"])
  })
   
}









