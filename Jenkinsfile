pipeline {
  agent any

  environment {
    mavenHome = tool(name: 'Maven-3.8.2', type: 'maven')
    mavenCMD = "${mavenHome}/bin/mvn"
  }

  stages {
    stage('SCM Checkout') {
      steps {
        git(credentialsId: 'jkm-github', url: 'https://github.com/j-kyle-moore/spring-boot-mongo-docker.git', branch: '15sep21')
      }
    }

    stage('Maven Clean Package') {
      steps {
        //sh $mavenCMD clean package
        echo Maven clean package
      }
    }
  }
}
