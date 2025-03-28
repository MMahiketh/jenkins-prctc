pipeline {
    agent {
        label 'Agent-1'
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
            }
        }
        stage('deploy') {
            steps {
                sh 'echo This is deploy.'
                error 'SOME ERROR'
            }
        }
    }
    post {
        always {
            echo 'This section runs everytime, when pipeline runs'
        }
        success {
            echo 'This section runs, when pipeline is success'
        }
        failure {
            echo 'This section runs, when pipeline is failed'
        }
    }
}
