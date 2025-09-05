pipeline {
    agent any
    
    environment {
           NEXUS_REGISTRY = credentials('nexus-pass')
    }

    stages {
        stage('Checkout SCM GitHub') {
            steps {
                checkout([
                    $class: 'GitSCM',
                    branches: [[name: '*/main']], // Especifica la rama (ej. main o master)
                    userRemoteConfigs: [[
                        //credentialsId: 'tu-credentials-id', // ID de las credenciales en Jenkins
                        url: 'https://github.com/maverickti-github/devops.git' // URL de tu repositorio Git
                    ]]
                ])
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Docker Build-----'
                //Script para Generar la Imagen Docker nexus-server:5000/app:1.0
                sh './build/build-image.sh'
            }
        }
        stage('Push') {
            steps {
                echo 'Push Nexus Registry-----'
                //Script para push registry Nexus "nexus-server:5000 
                sh './push/push-image.sh'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying...'
                // Add your deploy commands here
            }
        }
    }
    post {
        always {
            echo 'Pipeline finished.'
        }
    }
}
