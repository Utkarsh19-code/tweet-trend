pipeline {
    agent {
        node {
            label 'maven'
        }
    }

environment {
  PATH = "/opt/apache-maven-3.9.6/bin:$PATH"
}
    stages {
        stage("build"){
          steps {
            sh 'mvn clean deploy -Dmaven.test.skip=true'
          }
        }

        stage("test"){
          steps {
            echo "--------report started------------"
            sh 'mvn surefire-report:report'
            echo "--------report ended-----------"
          }
        }
        stage('SonarQube analysis') {
          environment {
            scannerHome = tool 'utkarsh-sonar-scanner'
        }
          steps {
          withSonarQubeEnv('sonarqube-server') { // If you have configured more than one global server connection, you can specify its name
            sh "${scannerHome}/bin/sonar-scanner"
          }
          }
        }
    }
}

