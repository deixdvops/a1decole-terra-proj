data "aws_subnet" "sub_pub1" {
  filter {
    name   = "tag:Name"
    values = ["SP-cloud-ops-sandbox-public-subnet-1"]
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

data "aws_subnet" "sub_pub2" {
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

data "aws_subnet" "sub_pub3" {
  filter {
    name   = "tag:Name"
    values = ["SP-cloud-ops-sandbox-public-subnet-3"]
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
