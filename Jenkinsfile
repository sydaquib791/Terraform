pipeline {
    agent any
    
    environment {
        // You can update this to your specific credentials ID in Jenkins
        AWS_CREDENTIALS_ID = 'AWS-creds'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Terraform Init') {
            steps {
                withCredentials([aws(credentialsId: "${AWS_CREDENTIALS_ID}", accessKeyVariable: 'AWS_ACCESS_KEY_ID', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                    sh 'terraform init'
                }
            }
        }

        stage('Format Check') {
            steps {
                sh 'terraform fmt -check'
            }
        }

        stage('Validate') {
            steps {
                sh 'terraform validate'
            }
        }

        stage('Plan') {
            steps {
                withCredentials([aws(credentialsId: "${AWS_CREDENTIALS_ID}", accessKeyVariable: 'AWS_ACCESS_KEY_ID', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                    sh 'terraform plan -out=tfplan'
                }
            }
        }

        stage('Manual Approval') {
            steps {
                input message: 'Do you want to apply this Terraform plan?', ok: 'Approve Deployment'
            }
        }

        stage('Apply') {
            steps {
                withCredentials([aws(credentialsId: "${AWS_CREDENTIALS_ID}", accessKeyVariable: 'AWS_ACCESS_KEY_ID', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                    sh 'terraform apply -auto-approve tfplan'
                }
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}
