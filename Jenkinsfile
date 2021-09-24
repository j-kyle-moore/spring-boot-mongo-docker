pipeline {
  agent any
  stages {
    stage('SCM Checkout') {
      steps {
        git(credentialsId: 'jkm-github', url: 'https://github.com/j-kyle-moore/spring-boot-mongo-docker.git', branch: '15sep21')
      }
    }

    stage('Maven Clean Package') {
      steps {
        script {
          env.mavenHome = tool name: "Maven-3.8.2", type: "maven"
          env.mavenCMD = "${mavenHome}/bin/mvn"
          echo 'Maven clean package'
          echo "Maven home is ${mavenHome}"
          echo "Maven cmd is ${mavenCMD}"
          sh "${mavenCMD} clean package"
        }
      }
    }

    stage('Build Docker Image') {
      steps {
        script {
          env.dockerHome = tool name: "jenkinsDocker"
          env.PATH = "${dockerHome}/bin:${env.PATH}"
          echo 'Checking docker version...'
          sh 'docker -v'
          echo 'Building docker image...'
          sh 'docker build -t eaddev/spring-boot-mongo .'
        }
      }
    }
  }
}
