variable "AWS_ACCESS_KEY" {
  type = string
  default = "AKIAWZQUPLR3UJFZPGV6"
}

variable "AWS_SECRET_KEY" {
    default = "63wrKZ+5CFXrv/svk+s/gB8ZzWq3JHiyx4rrXzge"
  
}

variable "AWS_REGION" {
    default = "ap-south-1"
  
}


variable "ami" {
    type = map
    default = {
        us-east-1 = "ami-06a1f46caddb5669e"
        us-east-2 = "ami-00280fb6ed84811ce"
        us-west-2 = "ami-022c9f1a24f813bf9"
        us-west-1 = "ami-075138a50b1af6e68"
        ap-south-1 = "ami-0e7e9cf689200b454"

    }
  
}

variable "inst-type" {
    default = "t2.micro"
  
}

variable "acl" {
    default     = "private"
}

variable "tags" {
    type        = map
    default     = {
        environment = "DEV"
        terraform   = "true"
    }
}

variable "bucket_prefix" {
    type        = string
    
    default     = "batch12-suresh-s3bucket"
}
