variable "instance_type" {
    default = {
  dev = "t2.micro"
  prod = "t3.medium"
    }
}

variable "allocated_storage" {
    default = {
        dev=10
        prod=20
    }
  
}

variable "instance_class" {
  default = {
    dev = "db.t3.micro"
    prod = "db.t4g.micro"
  }
}
