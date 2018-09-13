variable "AMI" {
	type = "map"
	default = {
		ap-south-1 = "ami-00b7e666605d33085"
	}
}

variable "AWS_ACCESS_KEY" {
	default = "AKIAIPM2D5OB6TPINCSQ"
}

variable "AWS_SECRET_ACCESS_KEY" {
	default = "338zVyX/GrnIoVvD0L5mWW1MTPzglfttOdrnq229"
}

variable "REGION" {
	default = "ap-south-1"
}

variable "PATH_TO_PUBLICKEY" {
	default = "./terraform_kp.pub"
}
