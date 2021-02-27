pipeline {
    agent any
	tools {
	    maven 'Maven3'
		}	 
 stages {
      stage('checkout') {
           steps {
             
                git credentialsId: '8068e870-894d-4f9e-aede-8586b4ef7ca4', url: 'https://github.com/chinthirla/CI-CD-using-Docker.git'
             
          }
        }
	 stage('Execute Maven') {
           steps {
             
                sh 'clean package'             
          }
        }
        

  stage('Docker Build and Tag') {
           steps {
              
                sh 'docker build -t samplewebapp:latest .' 
                sh 'docker tag samplewebapp chinthirla/samplewebapp:latest'
                //sh 'docker tag samplewebapp nikhilnidhi/samplewebapp:$BUILD_NUMBER'
               
          }
        }
     
  stage('Publish image to Docker Hub') {
          
            steps {
        	withCredentials([string(credentialsId: 'Docker-hub', variable: 'DockerHub')]) {
                sh "docker login -u vijay.itblabs@gmail.com -p ${DockerHub}"
                }
                sh  'docker push chinthirla/samplewebapp:latest'
                //  sh  'docker push nikhilnidhi/samplewebapp:$BUILD_NUMBER' 
        }
    }
stage('Run Docker container on Jenkins Agent') {
             
            steps 
			{
                sh "docker run -d -p 8003:8080 chinthirla/samplewebapp"
 
            }
        }
    }
}
    
