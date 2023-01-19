#!/bin/bash

# Add your custom installers and other tasks here.
# Make sure you put them with "sudo" command and add "-y" option for non-interactive mode

# eg: sudo yum install -y nginx


sudo yum install git -y
echo "running ansible installation"
sudo amazon-linux-extras install ansible2 -y
ansible --version

echo  "ansible installed"





