resource "aws_key_pair" "ansible" {
     key_name = "ansible"
     public_key = "${file(var.PUBLIC_KEY_PATH)}"
     }

resource "aws_instance" "app1" {
    ami = "${lookup(var.AMI, var.AWS_REGION)}"
    instance_type = "t2.micro" #free tier instance type used - t2.medium for DevMinds Training

	root_block_device {
	delete_on_termination=true
	}

	# VPC
    subnet_id = "${aws_subnet.dev-subnet-public-1.id}"

	# Security Group
    vpc_security_group_ids = ["${aws_security_group.ssh-allowed.id}"]

	#Public key
    key_name = "${aws_key_pair.ansible.id}"
	
    connection {
        type        = "ssh"
        user        = "${var.EC2_USER}"
        private_key = "${file("${var.PRIVATE_KEY_PATH}")}" #ssh user public_key
        timeout     = "3m"
        host        = "${self.public_ip}" #returns public_ip of instance
        #host        = "${self.private_ip}"
    }

	# Shopizer prerequisite installs
    provisioner "file" {
        source = "prerequisites.sh"
        destination = "/tmp/prerequisites.sh"
    }
    provisioner "remote-exec" {
        inline = [
             "chmod +x /tmp/prerequisites.sh",
	     "/tmp/prerequisites.sh"
        ]
    }
}
