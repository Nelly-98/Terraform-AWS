resource "aws_vpc" "wp_vpc"{
    cidr_block = var.cidr_block
    enable_dns_support = true
    enable_dns_hostnames = true
    tags = {
        Name = "NellyVPC"
    }
}


