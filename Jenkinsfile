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
          // sh "${mavenCMD} clean package"
        }
      }
    }

    stage('Build Docker Image') {
      agent any
      steps {
        script {
          env.dockerHome = tool name: 'jenkinsDocker'
          env.dockerCMD = "${dockerHome}/bin/docker"
          env.PATH = "${dockerHome}/bin:${env.PATH}"
          echo "Docker home is ${dockerHome}"
          echo "ls -l ${dockerHome}/bin"
          sh "ls -l ${dockerHome}/bin"
          echo "Docker cmd is ${dockerCMD}"
          echo "Which docker ..."
          sh "which docker"
          sh "docker run -entrypoint="/bin/bash" -i test"
          echo "Checking docker version..."
          sh "${dockerCMD} --version"
          echo "Building docker image..."
          sh "${dockerCMD} build -t eaddev/spring-boot-mongo ."
        }
      }
    }
  }
}
