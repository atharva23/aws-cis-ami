#check if new ami created 
latest_ami_date=$(aws ec2 describe-images --filters "Name=name,Values=ami-*" "Name=state,Values=available" "Name=architecture,Values=x86_64" --query 'reverse(sort_by(Images, &CreationDate))[0].CreationDate' --output text)
current_date=$(date +%s)
time_diff=$(( (current_date - $(date --date="$latest_ami_date" +%s)) / 86400 ))
if [ $time_diff -lt 1 ]; then
  echo "Amazon Linux 2 AMI has changed in the last 1 day"
  packer validate -var-file=variables.json cis-ami.pkr.hcl
  aws ssm put-parameter --name "/gemini/latest-ami" --value "$(packer build  -var-file=variables.json cis-ami.pkr.hcl | awk '/^us-east-1:/ {print $2}')" --type String --overwrite
else
  echo "Amazon Linux 2 AMI has not changed in the last 1 day no need to build new image"
fi


#validate packer 
#packer validate -var-file=variables.json cis-ami.pkr.hcl

#to create ami and extract ami id
#packer build  -var-file=variables.json cis-ami.pkr.hcl | awk '/^us-east-1:/ {print $2}'^C
