pipeline {
    agent any
    
    stages {
        stage('Run Packer') {
            steps {
                sh '''
                packer build  -var-file=variables.json cis-ami.pkr.hcl
                '''
                
               
            }
        }
    }
}
