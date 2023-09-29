pipeline {
    agent any
    tools {
        maven 'maven3'
        jdk 'java17'
        dockerTool 'docker24'
    }
    stages {
        stage("SCM Checkout") {
            steps {
                git branch: 'main', url: 'https://github.com/uglk/normal_spring.git'
            }
        }
    }
}
