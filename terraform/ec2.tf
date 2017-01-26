# ec2 instance -----------------------------------------------------------------

resource "aws_instance" "webapp" {
    ami                         = "${lookup(var.amis, var.region)}"
    instance_type               = "${var.instance_type}"
    vpc_security_group_ids      = ["${aws_security_group.webapp.id}"]
    subnet_id                   = "${lookup(var.subnets, var.region)}"
    associate_public_ip_address = "true"

    tags {
        Name                    = "${var.env}.${var.name}"
        env                     = "${var.env}"
    }

    user_data                   = "${data.template_file.userdata.rendered}"
}

output "webapp-public-ip" {
    value                       = "${var.env} - ${aws_instance.webapp.public_ip}"
}


# userdata template ------------------------------------------------------------

data "template_file" "userdata" {
  template                      = "${file(var.user_data_filename)}"

  vars {
    env                         = "${var.env}"
  }
}
