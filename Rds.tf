# Creating RDS Instance
resource "aws_db_subnet_group" "default" {
  name       = "main"
  subnet_id  = "${aws_subnet.public-subnet-1.id}"

  tags = {
    Name = "My DB subnet group"
  }
}

resource "aws_db_instance" "default" {
  allocated_storage      = 10
  engine                 = "mysql"
  engine_version         = "8.0.20"
  instance_class         = "db.t2.micro"
  multi_az               = true
  name                   = "db_name"
  username               = "username"
  password               = "password"
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.sg_allow_ssh_jenkins.id]
}