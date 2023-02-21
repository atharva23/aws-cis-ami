pipeline {
    agent any
    
    stages {
        
        
        stage('Packer Build ') {
            steps {
                sh '''
                ./Buildami.sh
                '''
                
               
            }
        }
    }
}
