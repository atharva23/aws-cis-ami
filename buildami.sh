#check if new ami created 

#validate packer 

#to create ami and extract ami id
packer build  -var-file=variables.json cis-ami.pkr.hcl | awk '/^us-east-1:/ {print $2}'^C
