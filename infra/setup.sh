#!/bin/bash

#Add Jenkins repo
yum update -y
wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
yum upgrade

#Install
  #Dependencies
dnf install git java-17-amazon-corretto -y
  #Jenkins & Docker
yum install jenkins docker -y


#Start service
  #Jenkins
systemctl enable jenkins
systemctl start jenkins
  #docker 
service docker start
usermod -a -G docker ec2-user
chmod 666 /var/run/docker.sock
