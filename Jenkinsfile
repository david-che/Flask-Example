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
        sh 'docker build -t david755chen/flask-example:$BUILD_ID .'
      }
    }

    stage('Test') {
      steps {
        echo 'Test'
        sh 'docker run -d -p 6969:6969 --name flask-demo flask-example:$BUILD_ID'
        sh 'sleep 5'
        sh 'curl localhost:6969'
        sh 'docker stop flask-demo && docker rm flask-demo'
      }
    }

    stage('push to Docker-Hub') {
      steps {
        echo 'push to Docker-Hub'
        withCredentials(bindings:[usernamePassword(credentialsId: 'docker-hub', passwordVariable: 'pass', usernameVariable: 'user')]) {
          sh 'docker login -u $user -p $pass'
          sh '''docker push david755chen/flask-example:$BUILD_ID'''
        }
      }
    }

  }
}
