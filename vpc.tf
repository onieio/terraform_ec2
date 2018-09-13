resource "aws_vpc" "TF_VPC" {
	cidr_block = "10.20.0.0/23"
	instance_tenancy = "default"
	tags {
		Name = "TF_VPC"
	}
}

resource "aws_subnet" "TF_SB" {
	vpc_id = "${aws_vpc.TF_VPC.id}"
	cidr_block = "10.20.0.0/24"
	availability_zone = "ap-south-1a"
	tags {
		Name = "TF_SUBNET"
	}
}

resource "aws_subnet" "TF_SB2" {
	vpc_id = "${aws_vpc.TF_VPC.id}"
	cidr_block  = "10.20.1.0/24"
	availability_zone = "ap-south-1b"
	tags {
		Name = "TF_SUBNET2"
	}
}

resource "aws_internet_gateway" "TF_GW" {
	vpc_id = "${aws_vpc.TF_VPC.id}"
	tags {
		Name = "TF_GATEWAY"
	}
}

resource "aws_route_table" "TF_ROUTE" {
        vpc_id = "${aws_vpc.TF_VPC.id}"
	route {
		cidr_block = "0.0.0.0/0"
		gateway_id = "${aws_internet_gateway.TF_GW.id}"
	}
        tags {
                Name = "TF_ROUTE_TABLE"
        }
}

resource "aws_eip" "TF_EIP" {
	tags {
		Name = "TF_EIP"
	}
}

resource "aws_nat_gateway" "TF_NAT" {
	allocation_id = "${aws_eip.TF_EIP.id}"
	subnet_id = "${aws_subnet.TF_SB2.id}"
	tags {
		Name = "TF_NAT"
	}
}

resource "aws_route_table" "TF_ROUTE2" {
	vpc_id = "${aws_vpc.TF_VPC.id}"
	route {
		cidr_block = "0.0.0.0/0"
		nat_gateway_id = "${aws_nat_gateway.TF_NAT.id}"
		
	}
	tags {
		Name = "TF_ROUTE_TABLE2"
	}
}
