pipeline {
    agent { label 'worker' }

    parameters {
        string(name: 'REMOTE_USER', defaultValue: 'ubuntu', description: 'Remote user for SSH')
        string(name: 'REMOTE_HOST', defaultValue: '51.20.74.85', description: 'Remote host for SSH')
        string(name: 'DST_FOLDER', defaultValue: '/home/ubuntu/app', description: 'Destination folder on remote server')
    }

    environment {
        NODE_OPTIONS = '--max-old-space-size=4096'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', credentialsId: 'gitlab', url: 'git@gitlab.com:ukrgorban/catalogbooks.git'
            }
        }

        stage('Prepare Remote Directory') {
            steps {
                sshagent(credentials: ['aws']) {
                    sh """
                    ssh -o StrictHostKeyChecking=no ${REMOTE_USER}@${REMOTE_HOST} 'if [ -d "${DST_FOLDER}" ] && [ "\$(ls -A ${DST_FOLDER})" ]; then
                        echo "Directory ${DST_FOLDER} is not empty. Deleting...";
                        sudo rm -rf ${DST_FOLDER}/*;
                    fi;
                    mkdir -p ${DST_FOLDER}'
                    """
                }
            }
        }

        stage('Transfer Files') {
            steps {
                sshagent(credentials: ['aws']) {
                    sh """
                    scp -o StrictHostKeyChecking=no -r ./ ${REMOTE_USER}@${REMOTE_HOST}:${DST_FOLDER}
                    """
                }
            }
        }

        stage('Run on Remote Server') {
            steps {
                sshagent(credentials: ['aws']) {
                    sh """
                    ssh -o StrictHostKeyChecking=no ${REMOTE_USER}@${REMOTE_HOST} 'cd ${DST_FOLDER};
                    if [ "\$(docker ps -q)" ]; then
                        echo "Stopping running Docker containers...";
                        sudo docker stop \$(docker ps -q);
                        echo "Removing Docker containers...";
                        sudo docker rm \$(docker ps -aq);
                    fi;
                    echo "Bringing down any existing Docker Compose setup...";
                    sudo docker-compose down;
                    echo "Starting Docker Compose in detached mode...";
                    sudo docker-compose up -d'
                    """
                }
            }
        }
    }

    post {
        success {
            echo '✅ Pipeline completed successfully!'
        }
        failure {
            echo '❌ Pipeline failed!'
        }
    }
}
