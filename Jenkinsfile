pipeline {
  agent any
  stages {
    stage('Clone repository') {
      steps {
        git 'https://github.com/atharva23/aws-cis-ami'
      }
    }
    stage('Build AMI') {
      steps {
        sh './buildami.sh'
      }
    }
   
  }
}
