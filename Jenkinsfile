node {
   def app
   environment {
    registry = "chetan8123/my_app_container"
    registryCredential = 'dockerhub'
  }
   stage('SCM Checkout'){
     git 'https://github.com/ChetanKumar07/Jenkins-SonarQube-New'
   }
   stage('Compile-Package'){
      // Get maven home path
      def mvnHome =  tool name: 'Maven', type: 'maven' 
      if (isUnix()) {
      sh "${mvnHome}/bin/mvn -Dmaven.test.failure.ignore clean package"
      } else {
      echo 'Build and package maven artifact'
         bat(/"${mvnHome}\bin\mvn" -Dmaven.test.failure.ignore clean package/)
         bat(/"${mvnHome}\bin\mvn" -Dmaven.test.failure.ignore clean install/)
      }
   }
   
   stage('SonarQube Analysis') {
        def mvnHome =  tool name: 'Maven', type: 'maven'
        withSonarQubeEnv('SonarQube') { 
          // sh "${mvnHome}/bin/mvn sonar:sonar"
          bat (/"${mvnHome}\bin\mvn" sonar:sonar/)
        }
    }
   stage('Building image') {
        script {
          //docker.build registry + ":$BUILD_NUMBER"
          app = docker.build("chetan8123/my_app_container")
        }
        echo "Building Docker Image"
      }
   stage('Push Image into DockerHub') {
        script {
          //docker.withRegistry( 'https://registry.hub.docker.com', 'dockerhub' ) {
            //dockerImage.push()
            bat (/"docker" login/)
            app.push("latest")
          //}
        echo "Pushing Docker Build to DockerHub"
      }
    }
}
