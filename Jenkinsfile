pipeline {
    agent { label 'agent-2' }
    stages {
    
        stage('Pre-build') {
                steps {
                    // Add pre-build steps here
                    sh 'echo "Running pre-build steps"'
                    sh 'ls /home/jenkins/workspace/usprawnienia'
                    sh 'echo $WORKSPACE'
                    sh 'pwd'
                }
            }
        
        stage('Build') {
            steps {
                // Run Docker Compose instead of checking out Git branch
                sh 'docker-compose up --build'
                echo "$WORKSPACE"
        }
        }
        stage('Test') {
            steps {
                    
                    sh '''
                        docker compose -f docker-compose.yml run web python manage.py test
                        echo "tests are completed"
                       '''
            }
        }
        stage('Post-build') {
            steps {
                script{
                // Add post-build steps here
                sh '''docker compose -f docker-compose.yml down
                      docker tag usprawnienia-web 192.168.0.10:5000/usprawnienia_web
                      docker push 192.168.0.10:5000/usprawnienia_web
                   '''
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
        
    }
        }
}
}
