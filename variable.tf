variable "instanceami" {
    default =   "ami-05d2d839d4f73aafb"
} 

variable "instancetype" {
   default = "t3.micro"
}

variable "keyname" {
   default = "ubuntu"
}

variable "sg" {
    default = "sg-05520a2ca525d2bc3"
} 
variable "api_termination" {
  default = true
} 

variable "nosofinstance" {
  default = 2
}


#data types 
#  1    =   number 
#  "anup", "1" = string 
#  true  = boolean 
#  2.1 = float  