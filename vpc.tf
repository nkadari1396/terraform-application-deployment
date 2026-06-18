resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = var.enable_dns_hostnames


  tags = merge (
    var.common_tags,
    var.vpc_tags,
    {
        Name = "${local.resource_name}"
    }
  )
}


resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = merge (
    var.common_tags,
    var.igw_tags,
    
    {
    Name = "${local.resource_name}-igw"
    }

  )
}



resource "aws_subnet" "public" {
  vpc_id = aws_vpc.main.id
  cidr_block = var.public_subnet_cidr
  availability_zone = local.az_names
  map_public_ip_on_launch = true

  tags = merge (
    var.common_tags,
    var.public_subnet_tags,
    {
        Name = "${local.resource_name}-public-${local.az_names}"
    }
  )

}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  
  tags = merge (
    var.common_tags,
    var.public_route_table_tags,
    {
    Name = "${local.resource_name}-public"
    }
  )
}

resource "aws_route" "public"{
    route_table_id = aws_route_table.public.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id      = aws_internet_gateway.igw.id

}

resource "aws_route_table_association" "example" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}