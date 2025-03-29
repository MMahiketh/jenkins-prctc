#!/bin/bash

yum update -y
yum install yum-utils -y

#Add repo
  #Jenkins
  wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
  rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
  #Terraform
  yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo

yum upgrade


#Install
  #Dependencies
  dnf install git java-17-amazon-corretto -y
  #Jenkins, Docker, Terraform
  yum install jenkins docker terraform -y


#Start service
  #Jenkins
  systemctl enable jenkins
  systemctl start jenkins
  #docker 
  service docker start
  usermod -a -G docker ec2-user
  chmod 666 /var/run/docker.sock
