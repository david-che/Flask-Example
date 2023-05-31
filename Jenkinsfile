pipeline {
  agent any
  stages {
    stage('Checkout code') {
      steps {
        echo 'Checkout code'
        git(url: 'https://github.com/david-che/Flask-Example.git', branch: 'main', changelog: true, poll: true)
      }
    }

    stage('Build') {
      steps {
        echo 'Build'
        sh 'docker build -t flask-example:$BUILD_ID .'
      }
    }

    stage('Test') {
      steps {
        echo 'Test'
        sh 'docker run -d -p 6969:6969 flask-example:$BUILD_ID '
        sh 'sleep 5'
        sh 'curl localhost:6969'
      }
    }

    stage('push to Docker-Hub') {
      steps {
        echo 'push to Docker-Hub'
      }
    }

  }
}