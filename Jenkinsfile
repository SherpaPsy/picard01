pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        sh 'docker image build -t node-app1 .'
      }
    }
    stage('Run') {
      steps {
        sh 'docker container run -d -p 8090:3000 --rm --name node-app1 node-app1'
      }
    }
    stage('Test') {
      steps {
        sh './newmantest.sh'
      }
    }
    stage('Cleanup') {
      steps {
        sh 'docker container stop node-app1'
      }
    }
  }
}