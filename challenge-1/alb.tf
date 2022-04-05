resource "aws_lb" "alb" {
  name               = "${var.service}-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = ["${aws_subnet.public.id}"]
}

resource "aws_lb_target_group" "tg" {
  name     = "${var.service}-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc.id
}

resource "aws_autoscaling_attachment" "app-attach" {
  lb_target_group_arn    = aws_lb_target_group.tg.arn
  autoscaling_group_name = aws_autoscaling_group.asg.id
}

resource "aws_security_group" "alb_sg" {
  vpc_id = aws_vpc.vpc.id
  name   = "${var.service}-alb-sg"
}
