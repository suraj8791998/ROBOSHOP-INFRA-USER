pipeline {
    agent any 
    stages {
        stage('build') { 
            steps {
                echo "build"
            }
        }
        stage('Test') { 
            steps {
                // 
                echo "test"
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
