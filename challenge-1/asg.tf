resource "aws_autoscaling_group" "asg" {
  name                      = "${var.service}-asg"
  min_size                  = 1
  max_size                  = 1
  desired_capacity          = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
  vpc_zone_identifier       = ["${aws_subnet.private.id}"]

  launch_template {
    id      = aws_launch_template.app.id
    version = "$Latest"
  }
}

resource "aws_launch_template" "app" {
  name          = "${var.service}-app"
  image_id      = var.ami_id
  instance_type = "t2.micro"

  network_interfaces {
    associate_public_ip_address = false
    security_groups = [
      "${aws_security_group.app.id}"
    ]
  }
}

resource "aws_security_group" "app" {
  vpc_id = aws_vpc.vpc.id
  name   = "${var.service}-app-sg"
}

resource "aws_security_group_rule" "app_ingress" {
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "all"
  source_security_group_id = aws_security_group.alb_sg.id
  security_group_id        = aws_security_group.app.id
}
