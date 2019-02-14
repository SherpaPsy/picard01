pipeline {
	environment {
    dockerReg = "sherpapsy/node-app1"
    dockerRegCred = 'docker'
	dockerImage = ""
  }
  agent any
  stages {
    stage('Build') {
      steps {
		script {
			dockerImage = docker.build dockerReg + ":$BUILD_NUMBER"
		}
      }
    }
    stage('Run') {
      steps {
        sh 'docker container run -d -p 8090:3000 --rm --name $BUILD_TAG $dockerReg:$BUILD_TAG'
		//sh 'echo "Docker container is: $BUILD_TAG"'
      }
    }
    stage('Test') {
      steps {
        sh './newmantest.sh $BUILD_TAG'
      }
    }
    stage('Cleanup') {
      steps {
        sh 'docker container stop $BUILD_TAG'
      }
    }
  }
}