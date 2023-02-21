pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/atharva23/aws-cis-ami'
            }
        }
        
        stage('Packer Build ') {
            steps {
                sh '''
                ./Buildami.sh
                '''
                
               
            }
        }
    }
}
