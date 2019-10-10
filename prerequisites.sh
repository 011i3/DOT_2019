#!/bin/bash

# AWS TOOL BOX TASK - python3.6, pip3.6, aws cli, boto3, virtualenv, terraform, ansible, packer, java, git, apache maven
# Install some basic utilities first

cd ~
sudo yum update -y
sudo yum install -yy vim wget unzip
echo "vim wget unzip install done!"
sleep 5s

#Install python3.6 and pip3.6 or pip19.2.3?
#https://www.rosehosting.com/blog/how-to-install-python-3-6-4-on-centos-7/

sudo yum install -y https://centos7.iuscommunity.org/ius-release.rpm
sudo yum update -y
sudo yum install -y python36u python36u-libs python36u-devel python36u-pip
#sudo pip3 install --upgrade pip
echo "python pip install done!"
sleep 5s

#Install aws cli, boto3 & virtualenv using pip

pip3 install awscli --upgrade --user
sudo pip3 install boto3
sudo python3 -m venv env
echo "awscli boto3 virtualenv install done!"
sleep 5s

#Intall Terraform

wget https://releases.hashicorp.com/terraform/0.12.9/terraform_0.12.9_linux_amd64.zip
unzip terraform_0.12.9_linux_amd64.zip
sudo mv terraform /usr/local/bin
rm terraform_0.12.9_linux_amd64.zip
echo "terraform install done!"
sleep 5s


#install ansible

sudo yum install -y epel-release
sudo yum install -y ansible
echo "ansible install done!"
sleep 5s

#install packer
#https://gist.github.com/bbenson29/ab5be21dd13631febbc7cd7826ec3607

#wget https://releases.hashicorp.com/packer/1.4.3/packer_1.4.3_linux_amd64.zip
#sudo unzip -o packer_1.4.3_linux_amd64.zip -d /usr/local/


#sudo ln -s /usr/local/packer /usr/local/bin 

#sudo mv packer /usr/local/bin
#cd ~
#rm packer_1.4.3_linux_amd64.zip -y

#install git

sudo yum install -y git
echo "git insatll done!"
sleep 5s

#install java & apache maven
#https://phoenixnap.com/kb/how-to-install-apache-maven-on-centos-7

sudo yum install -y java-openjdk-devel java-openjdk
sudo yum install -y maven

echo "all install done yipee!!!"


#sudo ./install.sh
