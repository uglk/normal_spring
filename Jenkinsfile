pipeline {
    agent any
    tools {
        maven 'maven3'
        jdk 'java17'
        dockerTool 'docker24'
    }
    options{
        buildDiscarder(logRotator(numToKeepStr: '5', daysToKeepStr: ''))
        timestamps()
    }
    environment {
    DOCKERHUB_CREDENTIALS = credentials('docker')
    }
    stages {
        stage("SCM Checkout") {
            steps {
                git branch: 'main', url: 'https://github.com/uglk/normal_spring.git'
            }
        }
        stage("Maven clean"){
            steps{
                sh 'mvn clean'
            }
        }
        stage("Maven compile"){
            steps{
                sh 'mvn compile'
            }
        }
        stage("Maven test"){
            steps{
                sh 'mvn test'
            }
        }
        stage("Maven package"){
            steps{
                sh 'mvn package'
            }
        }
        // stage("Docker Build"){
        //     steps{
        //         sh 'docker build ullagallu/spring_petclinic: '
        //     }
        // }
    }
}
