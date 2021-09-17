pipeline{
  stages {   
    stage('SCM Checkout'){
        git credentialsId: 'jkm-github', url:  'https://github.com/j-kyle-moore/spring-boot-mongo-docker.git',branch: '15sep21'
    }

    stage(" Maven Clean Package"){
      def mavenHome =  tool name: "Maven-3.8.2", type: "maven"
      def mavenCMD = "${mavenHome}/bin/mvn"
      sh "${mavenCMD} clean package"

    }

    stage('Build Docker Image'){
        sh 'docker build -t eaddev/spring-boot-mongo .'
        //docker.withRegistry('https://harbor.rke2-app.km.test', 'harbor-km-test-eaddev'){
        //    app = docker.build("eaddev/")
        //}
    }
  }
}
