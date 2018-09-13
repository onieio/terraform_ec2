resource "aws_instance" "TF_EC2" {
	ami = "${lookup(var.AMI, var.REGION)}"
	instance_type = "t2.micro"
	# VPC id
	subnet_id = "${aws_subnet.TF_SB.id}"
	#Security Group	
	vpc_security_group_ids = ["${aws_security_group.TF_SG.id}"]
	key_name = "${aws_key_pair.terraform_kp.key_name}"
	root_block_device {
		volume_type = "gp2"
		volume_size = 10
		delete_on_termination = true
	}
	tags {
		Name = "TF_WebApp"
	}
}
