pipeline {
    agent {
        kubernetes {
            label 'dind-agent'
            yaml '''
            kind: Pod
            spec:
              containers:
              - name: docker
                image: [docker_hub_id]/dind-client-jenkins-agent
                tty: true
                command:
                - cat
                volumeMounts:
                - name: docker-sock
                  mountPath: /var/run/docker.sock
              volumes:
              - name: docker-sock
                hostPath:
                  path: /var/run/docker.sock
            '''
        }
    }
    stages {
        stage('Build and Run') {
            steps {
                sh 'docker-compose --version'
            }
        }
    }
}
