pipeline {
    agent any

    environment {
        DATABASE_URI = 'postgresql://postgres@bb-ads:5432/postgres'
    }

    stages {
        stage('Checkout') {
            steps {
                deleteDir()
                checkout scm
            }
        }

        stage('Test') {
            steps {
                sh 'echo "========================================================"'
                sh 'echo ${DATABASE_URI}'
                sh 'echo "========================================================"'
                sh 'npm clean-install'
                sh 'npm test'
            }
        }

        stage('Build') {
            steps {
                sh 'npm run build'
            }
        }

        stage('Build and Push Docker instance') {
            steps {
                sh 'docker build --platform linux/amd64 -t cc-ms-k8s-training.common.repositories.cloud.sap/bulletinboard-ads-i516008:v1 .'
                withCredentials([usernamePassword(credentialsId: 'registry-user', usernameVariable: 'USERNAME', passwordVariable: 'password')]) {
                    sh 'docker login -u $USERNAME -p $PASSWORD cc-ms-k8s-training.common.repositories.cloud.sap'
                }
                sh 'docker push cc-ms-k8s-training.common.repositories.cloud.sap/bulletinboard-ads-i516008:v1'
            }
        }

        stage('Deployment') {
            steps {
                withKubeConfig([credentialsId: 'kubeconfig']) {
                    sh 'kubectl apply -f deployment/apps'
                }
            }
        }
    }
}
