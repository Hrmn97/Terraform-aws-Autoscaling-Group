resource "aws_launch_template" "scale-demo" {
  name_prefix   = "scale-demo"
  image_id      = "ami-06ca3ca175f37dd66"
  instance_type = "t2.micro"
}

resource "aws_autoscaling_group" "sg" {
  name = "Auto-scale-demo"
  availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]
  desired_capacity   = 1
  max_size           = 1
  min_size           = 1
  health_check_type  = "EC2"

  launch_template {
    id      = aws_launch_template.scale-demo.id
    version = "$Latest"
  }
}
