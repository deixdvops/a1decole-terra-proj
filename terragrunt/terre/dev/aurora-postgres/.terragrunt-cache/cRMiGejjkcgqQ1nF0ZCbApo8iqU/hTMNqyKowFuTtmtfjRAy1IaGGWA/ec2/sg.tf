resource "aws_security_group" "ec2_sg" {
    name_prefix = "${var.tags["environment"]}-ec2-sg"
    description = "Allow inbound traffic from port 80"
    vpc_id            = data.aws_vpc.selected.id
    tags = merge(var.tags, {
    Name = format("%s-ec2-sg",  var.tags["environment"])
  })
    lifecycle {
        create_before_destroy = true
    }
}


resource "aws_security_group_rule" "ec2_allow_all_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.ec2_sg.id
}

resource "aws_security_group_rule" "ec2_allow_all_http" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.ec2_sg.id
}

resource "aws_security_group_rule" "ec2_allow_all_outbound" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.ec2_sg.id
}
