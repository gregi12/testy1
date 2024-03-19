pipeline {
    agent { label 'jenkins-agent' }
    stages {
    
        stage('Pre-build') {
                steps {
                    // Add pre-build steps here
                    sh '''
                          echo "Running pre-build steps"
                          docker system prune -a --volumes -f
                       '''
                    
                }
            }
        
        stage('Build') {
            steps {
                // Run Docker Compose instead of checking out Git branch
                sh 'docker compose up -d --build'
                echo "$WORKSPACE"
        }
        }
        stage('Test') {
            steps {
                    
                    sh '''
                        docker compose -f docker-compose.yml run web python manage.py test
                        echo "tests are completed"
                        docker images
                       '''
            }
        }
        stage('Post-build') {
            steps {
    
                // Add post-build steps here
                sh '''
                      docker tag tesxty-web 10.61.15.7:5000/tesxty-web:v1
                      docker push 10.61.15.7:5000/tesxty-web:v1
                   '''       
        }
    
        

    post {
        always{
           sh 'docker compose down --remove-orphans -v'
           sh 'docker compose ps'
        }
        failure {
            mail to: 'staty1@o2.pl',
                 subject: "Failed Pipeline: ${currentBuild.fullDisplayName}",
                 body: "Something is wrong with ${env.BUILD_URL}"
        }
        success {
            echo 'I succeeded!'
        }
        
    }
        }    
}
}
