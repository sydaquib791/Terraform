pipeline {
    agent any
    
    environment {
        // You can update this to your specific credentials ID in Jenkins
        AWS_CREDENTIALS_ID = 'AWS-creds'
        // Define the Terraform variable using TF_VAR_ prefix
        TF_VAR_ssh_public_key = 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDEPyyeZkVATqpH6vyhtc7tQZru0bFKkvYMQOXNRg+pUcNq9RbWkxJskohHArxh3lU64xtRHZZtZDqagrGO9qsfpd/R5i7vuTcgca1OgBZ0manf+ehU29WXuyy5fr2F7py9/I5Ar5xdAMDZu19gSHzhEJnYjJ4t6UWVEJU2UyDve6H3j5OG8nRBUzAyCad/s8QCOkGqPW3P//GxlWK9RqQy2v8OJLDcbUegXZjnZmXzVyes2tMvfDOU1b0dyh10ESn/3r4w+63sQ0D2GWm/MonNrXnHrEGVm/9UoHFy2byka/fFlRU4dNW3ewNqMMqOWPyrxO4DNihRW3QCe8md3AMd1DecRzxcdKT1tg9V2eYqitSikDrk5Ohga5/h+rHDYg0/j1v/pKTU8qqjGwfdNdY1xvFZxBY2bMb1PHAey9R8Ex6JcxYokWkL0nOlQaBqSFZ2dfCxwKTp0y6fHnJomVxCYOc1bNb4G/koghxzthu9uWiZWdb1rQPKiBnZRpZ/c1ktQwwPeVgsWPAn+uKwaamqyxV1S4BQluFF1kFBRUmO5G24DHJfFFvit4Bx6dHW54IowTaovwn90Ab53Retf6JB6ZbwIkCaiaHPLmnVcJuoegjKDh7t+StIjVDqTS4ByCT9Bez/Xdrk4CzpCDB5U35aalH+Tb1qoD0K9+8rmyyUhQ== lenovo@Mohammed'
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
