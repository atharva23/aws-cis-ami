pipeline {
    agent any
    triggers {
        cron('0 0 * * *')
    }
    stages {
        stage('Run Packer') {
            steps {
                sh 'cd aws-cis-ami'
                sh 'packer build  -var-file=variables.json cis-ami.pkr.hcl'
            }
        }
    }
}
