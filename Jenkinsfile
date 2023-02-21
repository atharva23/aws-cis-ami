pipeline {
  agent any
  stages {
    stage('Clone') {
      steps {
        git 'https://github.com/atharva23/aws-cis-ami.git'
      }
    }
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
