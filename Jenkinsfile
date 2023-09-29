pipeline {
    agent any
    tools {
        maven 'maven3'
        jdk 'java17'
        dockerTool 'docker24'
    }
    options{
        buildDiscarder(logRotator(numToKeepStr: '2', daysToKeepStr: ''))
        timestamps()
    }
    environment {
    DOCKERHUB_CREDENTIALS = credentials('docker')
    IMAGE_TAG = "${BUILD_NUMBER}"
    }
    stages {
        stage("SCM Checkout") {
            steps {
                git branch: 'main', url: 'https://github.com/uglk/normal_spring.git'
            }
        }
        stage("Maven clean"){
            // when { expression { false }}
            steps{
                sh 'mvn clean'
            }
        }
        stage("Maven compile"){
            // when { expression { false }}
            steps{
                sh 'mvn compile'
            }
        }
        stage("Maven test"){
            // when { expression { false }}
            steps{
                sh 'mvn test'
            }
        }
        stage("Maven package"){
            // when { expression { false }}
            steps{
                sh 'mvn package'
            }
        }
        stage("Docker Build"){
            steps{
                sh 'docker build -t ullagallu/spring_petclinic:$IMAGE_TAG .'
                sh 'docker tag ullagallu/spring_petclinic:$IMAGE_TAG ullagallu/spring_petclinic:latest'
            }
        }
        stage("Docker Push"){
            steps{
                withCredentials([usernamePassword(credentialsId: 'docker', passwordVariable: 'PASS', usernameVariable: 'USER')]) {
                    sh 'docker login -u $USER -p $PASS' 
                    sh 'docker push ullagallu/spring_petclinic:$IMAGE_TAG'
                    sh 'docker push ullagallu/spring_petclinic:latest'
                }
            }
        }
        stage("running the docker images"){
            steps{
               sh 'docker run -dit --name ullagallu/spring_petclinic:$IMAGE_TAG -p 8081:8080 ullagallu/spring_petclinic:$IMAGE_TAG'
               sh 'docker run -dit --name ullagallu/spring_petclinic:latest -p 8082:8080 ullagallu/spring_petclinic:latest'
            }
        }
    }
}
