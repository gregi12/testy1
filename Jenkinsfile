pipeline {
    agent { label 'jenkins-agent' }
    stages {
    
        stage('Pre-build') {
                steps {
                    // Add pre-build steps here
                    sh '''
                          echo "Running pre-build steps"
                          docker ps
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
            environment{
                IMAGE_TAG = "something"
                REPO_HOST = '10.61.15.7:5000'
                }
            
            steps {
                // Add post-build steps here
                 sh '/home/jenkins/send_to_repo3.sh'
                        
        }
        }        
}
}
