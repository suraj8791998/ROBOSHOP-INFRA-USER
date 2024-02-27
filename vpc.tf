# THIS RESOURCE WILL  CREATE A VPC 
resource "aws_vpc" "vpc_creation" {
  cidr_block       = var.cidr_block
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = merge(
    var.common_tags,
    {
      Name = "${var.project_name}-vpc-${var.environment}"
    }
  )
}

#THIS RESOURCE WILL CREATE PUBLIC SUBNET
resource "aws_subnet" "public_subnet" {
  count = length(var.public_cidr)
  vpc_id     = aws_vpc.vpc_creation.id
  cidr_block = var.public_cidr[count.index]
  map_public_ip_on_launch = true
  availability_zone = var.azs[count.index]


  tags =  merge(
    var.common_tags,
    {
      Name = "${var.project_name}-${var.public_subnet[count.index]}"
    }
  )
}

#THIS RESOURCE WILL CREATE PRIVATE SUBNET
resource "aws_subnet" "private_subnet" {
  count = length(var.private_cidr)
  vpc_id     = aws_vpc.vpc_creation.id
  cidr_block = var.private_cidr[count.index]
  availability_zone = var.azs[count.index]


  tags =  merge(
    var.common_tags,
    {
      Name = "${var.project_name}-${var.private_subnet[count.index]}"
    }
  )
}

#THIS RESOURCE WILL CREATE DATABASE SUBNET
resource "aws_subnet" "database_subnet" {
  count = length(var.database_cidr)
  vpc_id     = aws_vpc.vpc_creation.id
  cidr_block = var.database_cidr[count.index]
  availability_zone = var.azs[count.index]


  tags =  merge(
    var.common_tags,
    {
      Name = "${var.project_name}-${var.database_subnet[count.index]}"
    }
  )
}

#THIS RESOURCE WILL CREATE INTERNET GATEWAY 
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc_creation.id

  tags = merge(
    var.common_tags,
    {
      Name = "${var.project_name}-internet_gateway"
    }
  )
}

#THIS RESOURCE WILL CREATE PUBLIC ROUTE TABLE
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.vpc_creation.id

  tags =merge(
    var.common_tags,
    {
      Name = "${var.project_name}-public_rt-${var.environment}"
    }
  )
}

#THIS RESOURCE WILL ATTACH ROUTE TO PUBLIC ROUTE TABLE

resource "aws_route" "public" {
  route_table_id            = aws_route_table.public_rt.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.gw.id
}

#THIS RESOURCE WILL CREATE PRIBVATE ROUTE TABLE
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.vpc_creation.id

  tags =merge(
    var.common_tags,
    {
      Name = "${var.project_name}-private_rt-${var.environment}"
    }
  )
}

#THIS RESOURCE WILL CREATE DATABASE ROUTE TABLE
resource "aws_route_table" "database_rt" {
  vpc_id = aws_vpc.vpc_creation.id

  tags =merge(
    var.common_tags,
    {
      Name = "${var.project_name}-database_rt-${var.environment}"
    }
  )
}

#THIS RESOURCE WILL ASSOSIATE WITH PUBLIC SUBNET
resource "aws_route_table_association" "public" {
  count = length(var.public_cidr)
  subnet_id      = element(aws_subnet.public_subnet[*].id,count.index)
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "private" {
  count = length(var.private_cidr)
  subnet_id      = element(aws_subnet.private_subnet[*].id,count.index)
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "database" {
    count = length(var.database_cidr)
  subnet_id      = element(aws_subnet.database_subnet[*].id,count.index)
  route_table_id = aws_route_table.database_rt.id
}
