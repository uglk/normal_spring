pipeline {
    agent any
    tools {
        maven 'maven3'
        jdk 'java17'
        dockerTool 'docker24'
    }
    stages {
        stage("version") {
            steps {
                sh '''
                mvn --version
                java --version
                docker version
                ''' 
            }
        }
    }
}
