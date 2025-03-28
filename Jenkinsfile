pipeline {
    agent {
        label 'Agent-1'
    }
    options {
        timeout(time: 10, unit: 'MINUTES')
        disableConcurrentBuilds()
    //retry(3)
    }
    // environment {
    //     DEBUG = 'true'
    // }
    // parameters {
    //     string(name: 'PERSON', defaultValue: 'Mr.Jenkins', description: 'How should I say hello to?')
    //     text(name:'BIOGRAPHY', defaultValue: '', description: 'Print some info about the person')
    //     booleanParam(name: 'TOGGLE', defaultValue: true, description: 'Toggle this value')
    //     choice(name: 'CHOICE', choices: ['One', 'Two', 'Three'], description: 'Pick something')
    //     password(name: 'PASSWORD', defaultValue: 'secret', description: 'Enter a password')
    // }
    stages {
        // stage('Print Params') {
        //     steps{
        //         echo "Hello ${params.PERSON}"
        //         echo "Biography: ${params.BIOGRAPHY}"
        //         echo "Toggle: ${params.TOGGLE}"
        //         echo "Choice: ${params.CHOICE}"
        //         echo "Password: ${params.PASSWORD}"
        //     }
        // }
        stage('build') {
            steps {
                sh 'echo This is build.'
                sh 'env'
            }
        }
        stage('test') {
            steps {
                sh 'echo This is test.'
            //sh 'sleep 20'
            }
        }
        // stage('Approval') {
        //     input {
        //         message 'Should we continue?'
        //         ok 'Yes, proceed'
        //         // submitter 'alice,bob'
        //         // parameters {
        //         //     string(name: 'MAN', defaultValue: 'Mahi', description: 'Who should I say hello to?')
        //         // }
        //     }
        //     steps {
        //         echo "Hello, ${MAN}, nice to meet you."
        //     }
        // }
        stage('deploy') {
            when {
                experssion { env.GIT_BRANCH == '*/master' }
            }
            steps {
                sh 'echo This is deploy.'
            // error 'SOME ERROR'
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
