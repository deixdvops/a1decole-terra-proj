data "aws_vpc" "revive_vpc" {
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
    values = ["a1"]
  }
}