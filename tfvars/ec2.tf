resource "aws_instance" "expense" {
  #count = 3
  count = length(var.instance)
  ami           = "ami-09c813fb71547fc4f"
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_tls.id]    

  #  tags = {
  #   Name = var.instance[count.index]
  #  }

  tags = merge(
    var.common,
    {
      Name = "${var.project}-${var.environment}-${var.instance[count.index]}"
    }
  )
}


resource "aws_security_group" "allow_tls" {
  name        = "${var.project}-${var.environment}" # expense.dev or expense.prod
  description = "Allow TLS inbound traffic and all outbound traffic"

    ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
    egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project}-${var.environment}"
  }
}