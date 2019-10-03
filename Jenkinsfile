pipeline {
    // master executor should be set to 0
    agent any
    stages {
        stage('Build Jar') {
            steps {
                //sh vs bat (mac or win)
                sh "mvn clean package -DskipTests"
            }
        }
        stage('Build Image') {
            steps {
                //sh
                sh "docker build -t='johnsavath/selenium-docker-bdd' ."
            }
        }
        stage('Push Image') {
            steps {
			    withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'destiny1', usernameVariable: 'johnsavath')]) {
                    //sh
			        sh "docker login --username=${user} --password=${pass}"
			        sh "docker push johnsavath/selenium-docker-bdd:latest"
			    }
            }
        }
    }
}
