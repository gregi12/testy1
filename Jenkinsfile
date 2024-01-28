pipeline {
    agent any
    stages {
    
        stage('Pre-build') {
                steps {
                    // Add pre-build steps here
                    sh 'echo "Running pre-build steps"'
                    sh 'ls /var/lib/jenkins/workspace/dobre-testy'
                }
            }
        
        stage('Build') {
            steps {
                // Run Docker Compose instead of checking out Git branch
                sh 'docker compose up --build'
                sh 'ls /var/lib/jenkins/workspace/dobre-testy'
                sh 'docker ps'
        }
        }
        stage('Test') {
            steps {
                    
                    sh '''
                        docker ps
                        docker compose -f docker-compose.yml run web python manage.py test
                        echo "something created"
                        
                        
                       '''
            }
        }
        stage('Post-build') {
            steps {
                script{
                // Add post-build steps here
                sh 'docker compose -f docker-compose.yml down'
                }
            }
        }
    }
    

    post {
        failure {
            mail to: 'staty1@o2.pl',
                 subject: "Failed Pipeline: ${currentBuild.fullDisplayName}",
                 body: "Something is wrong with ${env.BUILD_URL}"
        }
        success {
            echo 'I succeeded!'
        }
        cleanup {
            sh 'docker system prune -f'
    }


}
}
