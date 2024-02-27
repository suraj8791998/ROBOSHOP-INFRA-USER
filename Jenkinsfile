pipeline {
    agent node 
    stages {
        stage('build') { 
            steps {
                sh 'terraform init'
            }
        }
        stage('Test') { 
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
