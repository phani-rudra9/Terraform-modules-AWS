pipeline {
    agent {
	label sample-slave    
    }
  //   tools {
  //   terraform 'terraform'
  // }
    environment {
    BRANCH_NAME = "master"
    REPO_NAME = "Terraform-modules-AWS"
  }
    parameters {
        string(name: 'Project', defaultValue: 'Demo Project', description: 'Project to provision infra in AWS Cloud')
        choice(name: 'Environment', choices: ['UAT', 'STAGE', "PROD"], description: 'Select Environment for Workspace')
        booleanParam (name : 'RUN_ONLY_PLAN', defaultValue: true, description: 'Use Checkbox to Run Terraform Plan Only Uncheck Checkbox to Run Terraform Plan with Apply/Destroy Stage.')
        choice(name: 'TERRAFORM_ACTION', choices: ['apply' , 'destroy'],  description: 'Do You Want to Apply or Destroy?')
        string(name: 'Branch', defaultValue: 'master', description: 'Enter Branch Name to Run')
    }

    stages {
        // stage('CleanWorkspace'){
        //    steps {
        //       cleanWs()
        //    }
        // }
        stage('Git checkout') {
            steps {
                checkout([
                    $class: 'GitSCM',
                    branches: [[name: "*/${BRANCH_NAME}"]],
                    userRemoteConfigs: [[credentialsId: 'git-creds', url: "https://github.com/phani-rudra9/${REPO_NAME}"]]
                ])       
            }   
       }
        stage('Terraform Initialize'){
           steps {
              sh 'terraform init -var-file="./env/${Environment}.tfvars"'
           }
        }
        stage('Select Workspace'){ 
           steps {
              sh 'terraform workspace new ${Environment} || terraform workspace select ${Environment}'
            }   
                
        }    
        stage('Terraform Plan'){ 
           steps {
              sh 'terraform plan -var-file="./env/${Environment}.tfvars" -out=./env/${Environment}tfplanout'
		   }
        }
        stage('Terraform Apply') {
            when {
                expression { params.TERRAFORM_ACTION == 'apply' && params.RUN_PLAN_ONLY == false}
            }
            steps {
              sh 'terraform apply -auto-approve "./env/${Environment}"tfplanout'
            }    
        }
        stage('Terraform Destroy') {
            when {
                expression { params.TERRAFORM_ACTION == 'destroy' && params.RUN_PLAN_ONLY == false}
            }
            steps {
              sh 'terraform destroy -auto-approve -var-file="./env/${Environment}.tfvars"'
            }    
        }
    } 
post {
     always {
       emailext to: 'lprudra9@gmail.com',
       attachLog: true, body: "Dear team pipeline is ${currentBuild.result} please check ${BUILD_URL} or PFA build log", compressLog: false,
       subject: "Jenkins Build Notification: ${JOB_NAME}-Build# ${BUILD_NUMBER} ${currentBuild.result}"
    }
}
}
