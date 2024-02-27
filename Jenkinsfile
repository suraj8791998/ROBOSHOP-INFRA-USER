pipeline {
    agent { label 'node' }
    stages {
        stage('init') { 
            steps {
                sh 'terraform init'
            }
        }
        stage('plan') { 
            steps {
                // 
                sh 'terraform plan'
            }
        }

         stage('approval') {
            steps {
                input('Do you want to proceed?')
            }
        }
        stage('apply') { 
            steps {
                // 
                sh 'terraform apply -auto-approve'
            }
        }

    }
}
