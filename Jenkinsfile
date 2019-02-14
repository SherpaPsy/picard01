pipeline {
	environment {
    dockerReg = 'sherpapsy/node-app1'
    dockerRegCred = 'docker'
	dockerImage = ''
  }
  agent any
  stages {
    stage('Build') {
      steps {
		script {
			dockerImage = docker.build dockerReg + ":$BUILD_NUMBER"
			dockerImage
		}
      }
    }
    stage('Run') {
      steps {
        sh 'docker container run -d -p 8090:3000 --rm --name $dockerImage $dockerImage'
      }
    }
    stage('Test') {
      steps {
        sh './newmantest.sh $dockerImage'
      }
    }
    stage('Cleanup') {
      steps {
        sh 'docker container stop $dockerImage'
      }
    }
  }
}