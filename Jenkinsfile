pipeline {
    agent {
        label 'Agent-1'
    }
    options {
        timeout(time: 10, unit: 'MINUTES')
        disableConcurrentBuilds()
        retry(3)
    }
    stages {
        stage('build') {
            steps {
                sh 'echo This is build.'
            }
        }
        stage('test') {
            steps {
                sh 'echo This is test.'
                //sh 'sleep 20'
            }
        }
        stage('deploy') {
            steps {
                sh 'echo This is deploy.'
                //error 'SOME ERROR'
            }
        }
    }
    post {
        always {
            echo 'This section runs everytime, when pipeline runs'
            deleteDir()
        }
        success {
            echo 'This section runs, when pipeline is success'
        }
        failure {
            echo 'This section runs, when pipeline is failed'
        }
    }
}
