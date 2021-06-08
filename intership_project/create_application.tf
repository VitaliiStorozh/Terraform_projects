provider "aws" {
  region = var.region
}

resource "aws_elastic_beanstalk_application" "Mingle" {
  name = var.name
}

resource "aws_elastic_beanstalk_environment" "mingle-env" {
  name                = "mingle-env"
  application         = aws_elastic_beanstalk_application.Mingle.name
  solution_stack_name = "64bit Amazon Linux 2 v3.3.1 running Docker"
  cname_prefix        = "mingle-env-domain"
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = "aws-elasticbeanstalk-ec2-role"
  }
  setting {
    namespace = "aws:ec2:vpc"
    name      = "VPCId"
    value     = "vpc-70dd5f1a"
  }
  setting {
    namespace = "aws:ec2:vpc"
    name      = "AssociatePublicIpAddress"
    value     = "true"
  }
  setting {
    namespace = "aws:ec2:vpc"
    name      = "Subnets"
    value     = "subnet-448fe52e, subnet-752c8d09, subnet-0d13a741"
  }
  setting {
    namespace = "aws:ec2:vpc"
    name      = "ELBSubnets"
    value     = "subnet-448fe52e, subnet-752c8d09, subnet-0d13a741"
  }
  setting {
    namespace = "aws:ec2:vpc"
    name      = "ELBScheme"
    value     = "Public"
  }
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "InstanceType"
    value     = "t3.medium"
  }
  setting {
    namespace = "aws:autoscaling:asg"
    name      = "Availability Zones"
    value     = "Any 3"
  }
  setting {
    namespace = "aws:autoscaling:asg"
    name      = "MinSize"
    value     = "1"
  }
  setting {
    namespace = "aws:autoscaling:asg"
    name      = "MaxSize"
    value     = "3"
  }
  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "ServiceRole"
    value     = "aws-elasticbeanstalk-service-role"
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "environment"
    value     = "ming"
  }

  setting {
    namespace = "aws:elasticbeanstalk:healthreporting:system"
    name      = "SystemType"
    value     = "enhanced"
  }
  setting {
    namespace = "aws:autoscaling:updatepolicy:rollingupdate"
    name      = "RollingUpdateEnabled"
    value     = "true"
  }
  setting {
    namespace = "aws:autoscaling:updatepolicy:rollingupdate"
    name      = "RollingUpdateType"
    value     = "Health"
  }
  setting {
    namespace = "aws:autoscaling:updatepolicy:rollingupdate"
    name      = "MinInstancesInService"
    value     = "2"
  }
  setting {
    namespace = "aws:autoscaling:updatepolicy:rollingupdate"
    name      = "MaxBatchSize"
    value     = "1"
  }
  setting {
    namespace = "aws:elb:loadbalancer"
    name      = "CrossZone"
    value     = "true"
  }
  setting {
    namespace = "aws:elasticbeanstalk:command"
    name      = "BatchSizeType"
    value     = "Fixed"
  }
  setting {
    namespace = "aws:elasticbeanstalk:command"
    name      = "BatchSize"
    value     = "1"
  }
  setting {
    namespace = "aws:elasticbeanstalk:command"
    name      = "DeploymentPolicy"
    value     = "Rolling"
  }
  setting {
    namespace = "aws:elb:policies"
    name      = "ConnectionDrainingEnabled"
    value     = "true"
  }
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "SecurityGroups"
    value     = "sg-7fa6d90e"
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "db_endpoint"
    value     = aws_db_instance.db.endpoint
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "db_user"
    value     = var.db_settings.db_user
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "db_password"
    value     = var.db_settings.db_password
  }
}

resource "aws_db_instance" "db" {
  allocated_storage   = 5
  engine              = "postgres"
  engine_version      = "9.6.1"
  instance_class      = "db.t2.micro"
  name                = "mingleenv"
  username            = var.db_settings.db_user
  password            = var.db_settings.db_password
  skip_final_snapshot = true
}
