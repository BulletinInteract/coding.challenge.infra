# global -----------------------------------------------------------------------

name                = "coding-challenge-webapp"
region              = "eu-central-1"
amis                = { "eu-central-1" = "ami-02a5a51f" }
                        # aws-elasticbeanstalk-amzn-2015.03.0.x86_64-docker-hvm-201509160410
vpcs                = { "eu-central-1" = "vpc-776bb31f" }
subnets             = { "eu-central-1" = "subnet-30801858" }


# ec2 instance -----------------------------------------------------------------

instance_type       = "t2.medium"
user_data_filename  = "userdata.sh"


# security group - ec2 instance ------------------------------------------------

# -- ingress

ingress_ports_from  = { "0" = "80" }
ingress_ports_to    = { "0" = "80" }
ingress_ports_type  = { "0" = "tcp" }
ingress_cidrs       = { "0" = "0.0.0.0/0" }

# -- egress

egress_ports_from  = { "0" = "443" }
egress_ports_to    = { "0" = "443" }
egress_ports_type  = { "0" = "tcp" }
egress_cidrs       = { "0" = "0.0.0.0/0" }
