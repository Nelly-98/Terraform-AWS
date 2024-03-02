resource "aws_subnet" "public"{
    count = length(var.public_subnets_cidrs)
    vpc_id = var.vpc_id
    cidr_block= var.public_subnets_cidrs[count.index]
    map_public_ip_on_launch = true
    availability_zone = var.availability_zones[count.index]
    tags = {
        Name = "PublicSubnet-${count.index}"
    }
}

resource "aws_subnet" "private"{
    count = length(var.private_subnets_cidrs)
    vpc_id = var.vpc_id
    cidr_block = var.private_subnets_cidrs[count.index]
    availability_zone = var.availability_zones[count.index]
    tags = {
        Name = "PrivateSubnet-${count.index}"
    }
}