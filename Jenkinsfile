pipeline {
    // master executor should be set to 0
    agent any
    stages {
        stage('Build Jar') {
            steps {
                //sh
                bat "mvn clean package -DskipTests"
            }
        }
        stage('Build Image') {
            steps {
                //sh
                bat "docker build -t='johnsavath/selenium-docker-bdd' ."
            }
        }
        stage('Push Image') {
            steps {
			    withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'destiny1', usernameVariable: 'johnsavath')]) {
                    //sh
			        bat "docker login --username=${user} --password=${pass}"
			        bat "docker push johnsavath/selenium-docker-bdd:latest"
			    }
            }
        }
    }
}
