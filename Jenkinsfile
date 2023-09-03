pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/Laxi4u/infra-jenkins']])
            }
        }
        
        stage('terraform init') {
            steps {
                sh ('terraform init -reconfigure') 
            }
        }
        
        stage('terraform plan') {
            steps {
                sh ('terraform plan -lock=false') 
            
            }
        }
        
        stage (" Action") {
            steps {
                echo "Terraform action is --> ${action}"
                sh ('terraform ${action}  -lock=false --auto-approve') 
           }
        }
    }
}
