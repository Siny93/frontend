pipeline {
  agent {
    label 'WORKSTATION'
  }

  triggers {
     pollSCM('*/2 * * * *')
  }

  stages {
    stage('compile the code') {
      steps {
        sh 'echo compile the code'
      }
    }

    stage('check the code quality') {
      steps {
        sh 'echo check the code quality'
      }
    }

    stage('test cases') {
      steps {
        sh 'echo test cases'
      }
    }


  }
}
