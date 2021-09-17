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
        sh '''def mavenHome =  tool name: "Maven-3.8.2", type: "maven"
def mavenCMD = "${mavenHome}/bin/mvn"
sh "${mavenCMD} clean package"'''
      }
    }

  }
}