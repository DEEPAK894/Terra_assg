pipeline {
    agent any

    environment {
        AWS_DEFAULT_REGION = 'us-east-1'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Terraform Init') {
            steps {
                script {
                    // Use withCredentials to securely pass AWS credentials
                    withCredentials([[
                        $class: 'AmazonWebServicesCredentialsBinding',
                        accessKeyVariable: 'AKIATK6MJJCYYMADR2GU',
                        secretKeyVariable: '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',
                        credentialsId: 'aws'
                    ]]) {
                        // Initialize Terraform with AWS provider credentials
                        sh 'terraform init'
                    }
                }
            }
        }

        stage('Terraform plan') {
            steps {
                script {
                    // Use withCredentials to securely pass AWS credentials
                    withCredentials([[
                        $class: 'AmazonWebServicesCredentialsBinding',
                        accessKeyVariable: 'AKIATK6MJJCYZ45HEUQS',
                        secretKeyVariable: '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',
                        credentialsId: 'aws'
                    ]]) {
                        // Run Terraform apply
                        sh 'terraform plan'
                    }
                }
            }
        }

        // ... (other stages)

        stage('Terraform apply') {
            steps {
                script {
                    // Use withCredentials to securely pass AWS credentials
                    withCredentials([[
                        $class: 'AmazonWebServicesCredentialsBinding',
                        accessKeyVariable: 'AKIATK6MJJCYZ45HEUQS',
                        secretKeyVariable: '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',
                        credentialsId: 'aws'
                    ]]) {
                        // Destroy Terraform resources
                        sh 'terraform apply -auto-approve'
                    }
                }
            }
        }
    }
}
