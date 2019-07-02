pipeline {
  agent any
  stages {
    stage('Checkout external proj') {
      steps {
        git branch: 'master',
          url: 'https://github.com/mariesillo/bootstrap-demo.git'
        sh "ls -lat"
      }
    }
    stage('Docker build') {
      steps {
        sh 'docker build -t bootstrap-demo .'   
      }
    }
    stage('Is container running?') {
      steps {
        sh 'docker ps'
      }
    }
    stage('Remove container') {
      steps {
        sh 'docker stop bootstrap-demo || true'
        sh 'docker rm bootstrap-demo || true'
      }
    }
    stage('Docker run') {
      steps {
        sh 'docker run -itd -p 9090:80 --name bootstrap-demo bootstrap-demo'
      }
    }
    stage('Validation') {
        steps {
           sh 'docker exec bootstrap-demo \
               curl localhost:80'
        }
    }
  }
}
