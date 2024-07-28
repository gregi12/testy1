pipeline {
    agent {
        kubernetes {
            yaml '''
            apiVersion: v1
            kind: Pod
            spec:
              containers:
              - name: docker
                image: ubuntu:20.04
                command:
                - cat
                tty: true
                securityContext:
                  privileged: true
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
        stage('Install Docker and Docker Compose') {
            steps {
                container('docker') {
                    script {
                        sh '''
                        apt-get update
                        apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
                        curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
                        add-apt-repository \
                           "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
                           $(lsb_release -cs) \
                           stable"
                        apt-get update
                        apt-get install -y docker-ce docker-ce-cli containerd.io
                        curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
                        chmod +x /usr/local/bin/docker-compose
                        docker --version
                        docker-compose --version
                        docker-compose up -d --build
                        '''
                    }
                }
            }
        }
        
    }
}
