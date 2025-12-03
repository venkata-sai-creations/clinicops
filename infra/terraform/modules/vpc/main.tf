variable "prefix" { type = string }
variable "vpc_cidr" { type = string, default = "10.0.0.0/16" }
variable "public_subnet_cidrs" { type = list(string) }
variable "private_subnet_cidrs" { type = list(string) }
variable "azs" { type = list(string) }
variable "enable_nat" { type = bool, default = false }
variable "tags" { type = map(string), default = {} }

resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = merge({
    Name = "${var.prefix}-vpc"
  }, var.tags)
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.this.id
  tags = { Name = "${var.prefix}-igw" }
}

resource "aws_subnet" "public" {
  for_each = { for idx, cidr in var.public_subnet_cidrs : idx => cidr }
  vpc_id            = aws_vpc.this.id
  cidr_block        = each.value
  availability_zone = element(var.azs, tonumber(each.key))
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.prefix}-public-${each.key}"
  }
}

resource "aws_subnet" "private" {
  for_each = { for idx, cidr in var.private_subnet_cidrs : idx => cidr }
  vpc_id            = aws_vpc.this.id
  cidr_block        = each.value
  availability_zone = element(var.azs, tonumber(each.key))
  map_public_ip_on_launch = false
  tags = {
    Name = "${var.prefix}-private-${each.key}"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id
  tags = { Name = "${var.prefix}-public-rt" }
}

resource "aws_route" "public_internet_access" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "public_assoc" {
  for_each = aws_subnet.public
  subnet_id      = each.value.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.this.id
  tags = { Name = "${var.prefix}-private-rt" }
}

resource "aws_route_table_association" "private_assoc" {
  for_each = aws_subnet.private
  subnet_id      = each.value.id
  route_table_id = aws_route_table.private.id
}

# OPTIONAL NAT (commented out by default)
# resource "aws_eip" "nat" {
#   count = var.enable_nat ? length(aws_subnet.public) : 0
#   vpc = true
#   tags = { Name = "${var.prefix}-nat-eip-${count.index}" }
# }
#
# resource "aws_nat_gateway" "nat" {
#   count = var.enable_nat ? length(aws_subnet.public) : 0
#   allocation_id = aws_eip.nat[count.index].id
#   subnet_id = element(aws_subnet.public.*.id, count.index)
#   tags = { Name = "${var.prefix}-nat-${count.index}" }
# }
#
# resource "aws_route" "private_nat" {
#   count = var.enable_nat ? length(aws_subnet.private) : 0
#   route_table_id         = aws_route_table.private.id
#   destination_cidr_block = "0.0.0.0/0"
#   nat_gateway_id         = element(aws_nat_gateway.nat.*.id, count.index)
# }
