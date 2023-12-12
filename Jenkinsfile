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
                        accessKeyVariable: 'AKIATK6MJJCY6E3DHHMN',
                        secretKeyVariable: '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',
                        credentialsId: 'AWS_New'
                    ]]) {
                        // Initialize Terraform with AWS provider credentials
                        sh 'terraform init'
                    }
                }
            }
        }

    // stage('Terraform plan') {
      //      steps {
       //         script {
                    // Use withCredentials to securely pass AWS credentials
         //           withCredentials([[
        //                $class: 'AmazonWebServicesCredentialsBinding',
         //               accessKeyVariable: 'AKIATK6MJJCY6E3DHHMN',
          //              secretKeyVariable: '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',
                 //       credentialsId: 'AWS_New'
                //    ]]) {
                //        // Run Terraform apply
               //         sh 'terraform plan'
             //       }
             //   }
           // }
       // }

        // ... (other stages)

        stage('Terraform apply') {
            steps {
                script {
                    // Use withCredentials to securely pass AWS credentials
                    withCredentials([[
                        $class: 'AmazonWebServicesCredentialsBinding',
                       
                        credentialsId: 'AWS_New'
                    ]]) {
                        // Destroy Terraform resources
                        sh 'terraform apply -auto-approve'
                    }
                }
            }
        }
    }
}
