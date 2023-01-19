pipeline {
    agent any
    
    stages {
        stage('Run Packer') {
            steps {
                sh 'pwd'
                
                sh 'sudo packer build  -var-file=variables.json cis-ami.pkr.hcl'
                
               
            }
        }
    }
}
