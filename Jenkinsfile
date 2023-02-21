pipeline {
  agent any
  stages {
   
    stage('Install Dependencies') {
      steps {
        sh 'cd aws-cis-ami && sudo ./install.sh'
      }
    }
    stage('Build AMI') {
      steps {
        sh 'cd aws-cis-ami && ./buildami.sh'
      }
    }
   
  }
}
