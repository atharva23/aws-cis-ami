#!/bin/bash

# This script does the AMI harening tasks by executing bash commands
# We can't directly copy the conf files to "root" owned directories via packer file provisioned
# So we put the files in /tmp and move them by executing this shell script

#sudo cp -r  ~/AMAZON-LINUX-2 ~/tmp/files
sudo ansible-playbook -i /etc/ansible/hosts  /tmp/AMAZON-LINUX-2/site.yml --become




# remove ansible and press "Y" automatically
yes Y | sudo yum remove ansible
sudo rm -rf .ansible
sudo rm -rf .cache
