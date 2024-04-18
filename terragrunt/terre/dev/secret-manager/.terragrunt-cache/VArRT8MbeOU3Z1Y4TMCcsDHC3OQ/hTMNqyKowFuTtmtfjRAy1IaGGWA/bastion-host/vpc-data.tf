data "aws_vpc" "del_vpc" {
  filter {
    name   = "tag:Name"
    values = ["SP-cloud-ops-sandbox-vpc"]
  }
  filter {
    name   = "tag:environment"
    values = ["sandbox"]
  }
  filter {
    name   = "tag:project"
    values = ["deix"]
  }
}

data "aws_subnet" "public-01" {
  filter {
    name   = "tag:Name"
    values = ["SP-cloud-ops-sandbox-public-subnet-2"]
  }
  filter {
    name   = "tag:environment"
    values = ["sandbox"]
  }
  filter {
    name   = "tag:project"
    values = ["deix"]
  }
}
