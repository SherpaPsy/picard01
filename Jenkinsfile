pipeline {
	environment {
		dockerReg = "sherpapsy/picard01"
		dockerRegCred = 'docker'
		dockerImage = ""
	}
	agent any
	options {
		buildDiscarder(logRotator(numToKeepStr: '3', artifactNumToKeepStr: '3'))
	}
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
				sh 'docker container run -d -p 8090:3000 --rm --name $BUILD_TAG $dockerReg:$BUILD_NUMBER'
			}
		}
		stage('Test') {
			steps {
				sh './newmantest.sh $BUILD_TAG'
			}
		}
		stage('Publish') {
			steps {
				script {
					docker.withRegistry( '', dockerRegCred ) {
						dockerImage.push()
						//unsure yet how to tag and push with .push() - but want both the build tagged artifact and latest
						sh 'docker push sherpapsy/picard01:latest'
					}
				}
			}
		}
		stage('Cleanup') {
			steps {
				sh 'docker container stop $BUILD_TAG'
				sh 'docker image rm $dockerReg:$BUILD_NUMBER'
			}
		}
	}
}