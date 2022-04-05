# KPMG Challenge 1

A 3 tier environment is a common setup. Use a tool of your choosing/familiarity create these resources. Please remember we will not be judged on the outcome but more focusing on the approach, style and reproducibility.

## My solution

As I work predominantly in Terraform with AWS in my current role these were my go to choices.
To deploy a three-tier environment, my first step was to create a VPC with 3 separate subnets in [vpc.tf](vpc.tf) to deploy each tier into.
An ALB is created in the public subnet to receive traffic and direct to the application in [alb.tf](alb.tf).
In [asg.tf](asg.tf) I have created an auto-scaling group to deploy an application to EC2, and the security group to allow ingress from the ALB.
And in [rds.tf](rds.tf) I have created a serverless RDS cluster in the data subnet.

Given this task was supposed be done in 30 minutes and I have now exceeded an hour I figured I should stop here.
The code validates and can generate a plan with the provided [.tfvars file](envs/dev.tfvars).
At this point if applied it should deploy a load-balancer pointing to a blank ec2 image which isn't listening, and a standalone empty database which nothing can talk to.

## Outstanding steps

Further work required:
* Configure security groups between the ASG and RDS
* Create database users
  * in past projects I have done this by deploying and invoking a lambda to connect to RDS and create the users
* Create an application to run in ec2.
