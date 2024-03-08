
# Resource: aws_subnet
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet

resource "aws_subnet" "private-subnet" {
  count             = length(var.availability_zones)
  vpc_id            = aws_vpc.main.id
  cidr_block        = cidrsubnet(var.cidr_block, 8, count.index + length(var.availability_zones))
  availability_zone = element(var.availability_zones, count.index)
  depends_on = [
    aws_vpc.main
  ]
  tags = merge(var.common_tags, {
    Name                                        = format("%s-%s-%s-private-subnet-${count.index + 1}", var.common_tags["owner"], var.common_tags["teams"], var.common_tags["environment"])
    "kubernetes.io/role/internal-elb"           = 1
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
  })
}

resource "aws_subnet" "public-subnet" {
  count                   = length(var.availability_zones)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = cidrsubnet(var.cidr_block, 8, count.index)
  availability_zone       = element(var.availability_zones, count.index)
  map_public_ip_on_launch = var.map_public_ip_on_launch
  depends_on = [
    aws_vpc.main
  ]
  tags = merge(var.common_tags, {
    Name = format("%s-%s-%s-public-subnet-${count.index + 1}", var.common_tags["owner"], var.common_tags["teams"], var.common_tags["environment"])

    "kubernetes.io/role/internal-elb"           = "1"
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
  })
}
