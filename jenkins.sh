#!/bin/bash

# Update all system packages
sudo yum update -y

# Add Jenkins repository to yum
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/rpm-stable/jenkins.repo

# Import Jenkins GPG key
sudo rpm --import https://pkg.jenkins.io/rpm-stable/jenkins.io-2026.key

# Upgrade packages
sudo yum upgrade -y

# Installing Java 17 (required by Jenkins)
sudo yum install java-21-amazon-corretto -y

# Install Jenkins
sudo yum install jenkins -y

# Enable and start Jenkins service
sudo systemctl enable jenkins
sudo systemctl start jenkins

# Install Docker
sudo yum install docker -y

# Start Docker service
sudo systemctl start docker
sudo systemctl enable docker

# Add Jenkins user to Docker group to allow Docker command usage
sudo gpasswd -a jenkins docker

# Install Git
sudo yum install git -y

# Install pip for Python 3
sudo yum install python3-pip -y

# Install Flask and Pytest using pip
pip3 install flask pytest

# Reboot the instance to apply all changes (e.g. group memberships)
reboot