variable "AWS_REGION" {
  default = "eu-west-1"
}

variable "AMI" {
  type = map(string)
  default = {
    eu-west-1 = "ami-3548444c" #centos free tier ami id
  }
}

variable "PUBLIC_KEY_PATH" {
  default = "/home/vagrant/.ssh/<publci-key-file>" #to ssh to instance
}

variable "PRIVATE_KEY_PATH" {
  default = "/home/vagrant/.ssh/<private-key-file>" #to ssh to instance
}

variable "EC2_USER" {
  default = "centos"
}

variable "SSH_KEY_PATH" {
  default = "/home/vagrant/.ssh/<private-key-file>" #deployment user private key
}

