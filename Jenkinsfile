pipeline {
    agent any
    
    stages {
        
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
