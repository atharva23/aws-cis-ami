pipeline {
  agent any
  stages {
    
      stage('Install Packer') {
      steps {
        sh 'cd ~'
        sh 'curl -O https://releases.hashicorp.com/packer/1.7.4/packer_1.7.4_linux_amd64.zip'
        sh 'unzip packer_1.7.4_linux_amd64.zip'
        sh 'echo "export PATH=$PATH:~/packer" >> ~/.bashrc'
        sh 'source ~/.bashrc'
        sh 'packer --version'
      }
    }
    stage('Build AMI') {
      steps {
        sh '''
          latest_ami_date=$(aws ec2 describe-images --filters "Name=name,Values=cis-hardened-aws-ami-*" "Name=state,Values=available" "Name=architecture,Values=x86_64" --query 'reverse(sort_by(Images, &CreationDate))[0].CreationDate' --output text)
          current_date=$(date +%s)
          time_diff=$(( (current_date - $(date --date="$latest_ami_date" +%s)) / 86400 ))
          if [ $time_diff -lt 1 ]; then
            echo "Amazon Linux 2 AMI has changed in the last 1 day"
            packer validate -var-file=variables.json cis-ami.pkr.hcl
            ami_value=$(packer build  -var-file=variables.json cis-ami.pkr.hcl | awk '/^us-east-1:/ {print $2}')
            echo $ami_value
            aws ssm put-parameter --name "/gemini/latest-ami" --value $ami_value --type String --overwrite
          else
            echo "Amazon Linux 2 AMI has not changed in the last 1 day no need to build new image"
          fi
        '''
      }
    }
  }
}
