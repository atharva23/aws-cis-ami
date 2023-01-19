pipeline {
    agent any
    triggers {
        cron('0 0 * * *')
    }
    stages {
        stage('Run Packer') {
            steps {
                sh 'pwd'
                sh './packer.sh'
                
               
            }
        }
    }
}
