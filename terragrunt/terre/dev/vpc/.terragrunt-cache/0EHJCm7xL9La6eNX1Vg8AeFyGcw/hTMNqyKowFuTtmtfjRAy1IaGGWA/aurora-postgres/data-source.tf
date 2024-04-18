data "aws_vpc" "vpc_id" {
  filter {
    name   = "tag:Name"
    values = ["SP-cloud-ops-sandbox-vpc"]
  }
}

data "aws_subnet" "private_1" {
  filter {
    name   = "tag:Name"
    values = ["SP-cloud-ops-sandbox-private-subnet-1"]
  }
}

data "aws_subnet" "private_2" {
  filter {
    name   = "tag:Name"
    values = ["SP-cloud-ops-sandbox-private-subnet-2"]
  }
}
data "aws_secretsmanager_secret" "rds_password" {
  name = "2560-dev-Alpha-artifactory-db-password"
}

data "aws_secretsmanager_secret_version" "rds_password" {
  secret_id = data.aws_secretsmanager_secret.rds_password.id
}

data "aws_secretsmanager_secret" "rds_username" {
  name = "2560-dev-Alpha-artifactory-db-username"
}

data "aws_secretsmanager_secret_version" "rds_username" {
  secret_id = data.aws_secretsmanager_secret.rds_username.id
}


## CREATE A DATABASE WITH USERNAME AND PASSWORD
# password = data.aws_secretsmanager_secret_version.rds_password.secret_string
# username = data.aws_secretsmanager_secret_version.rds_username.secret_string