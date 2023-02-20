pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Run Packer') {
            steps {
                sh '''
                packer build  -var-file=variables.json cis-ami.pkr.hcl
                '''
                
               
            }
        }
    }
}
