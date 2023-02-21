pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/atharva23/aws-cis-ami'
            }
        }
        
        stage('Packer Validate') {
            steps {
                sh '''
                packer validate -var-file=variables.json cis-ami.pkr.hcl
                '''
                
               
            }
        }
        
        stage('Packer Build ') {
            steps {
                sh '''
                packer build  -var-file=variables.json cis-ami.pkr.hcl
                '''
                
               
            }
        }
    }
}
