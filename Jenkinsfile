pipeline {
  agent {
    volumes: [
      persistentVolumeClaim(
          mountPath: '/root/.m2/repository',
          claimName: 'maven-repo-storage',
          readOnly: false
          )
      ]
  }

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
      agent any
      steps {
        echo 'Building docker image...'
        sh 'docker build -t eaddev/spring-boot-mongo .'
      }
    }
  }
}
