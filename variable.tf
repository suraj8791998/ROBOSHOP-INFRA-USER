variable "cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}


variable "common_tags" {
  type = map(any)
  default = {
    Environment = "Dev"
    TERRAFORM   = true
    Project     = "Roboshop"
  }
}

variable "environment" {
  default = "dev"
}
variable "project_name" {
  type    = string
  default = "Roboshop"
}


#THESE VARIABLES ARE FOR PUBLI SUBNET
variable "public_cidr" {
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "public_subnet" {
  default = ["public_subnet_1a", "public_subnet_1b"]
}

variable "azs" {
   default = ["us-east-1a","us-east-1b"]
}



#THESE VARIABLES ARE FOR private SUBNET

variable "private_cidr" {
  default = ["10.0.3.0/24", "10.0.4.0/24"]
}


variable "private_subnet" {
  default = ["private_subnet_1a", "private_subnet_1b"]
}

variable "database_cidr" {
  default = ["10.0.5.0/24", "10.0.6.0/24"]
}


variable "database_subnet" {
  default = ["database_subnet_1a", "database_subnet_1b"]
}
