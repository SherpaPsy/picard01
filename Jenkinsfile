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
        //sh 'docker container run -d -p 8090:3000 --rm --name $dockerImage $dockerImage'
		sh 'echo "Docker image is: $dockerReg:$BUILD_NUMBER"'
      }
    }
    stage('Test') {
      steps {
        sh './newmantest.sh $dockerReg:$BUILD_NUMBER"'
      }
    }
    stage('Cleanup') {
      steps {
        sh 'docker container stop $dockerReg:$BUILD_NUMBER'
      }
    }
  }
}