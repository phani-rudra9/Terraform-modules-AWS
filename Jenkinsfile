pipeline {
    agent any
    parameters {
        string(name: 'Project', defaultValue: 'Demo Project', description: 'Project to Deploy')
        choice(name: 'Environment', choices: ['UAT', 'STAGE', "PROD"], description: 'Select Workspace Environment')
        booleanParam (name : 'RUN_PLAN_ONLY', defaultValue: true, description: 'Use Checkbox checked to Run Terraform Plan Only. Uncheck Checkbox to Run Terraform Plan with Apply/Destroy Stage.')
        choice(name: 'TERRAFORM_ACTION', choices: ['apply' , 'destroy'],  description: 'Do You Want to Apply or Destroy?')
        string(name: 'Branch', defaultValue: 'master', description: 'Enter Branch Name to Run')
    }

    stages {
//         stage('CleanWorkspace'){
//            steps {
//               cleanWs()
//            }
//         }
        stage('Terraform Code Pull'){
           steps {
              git branch: '${Branch}', url: 'https://github.com/phani-rudra9/Terraform-modules-AWS.git'
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
    failure {
        mail to: 'lra9@gmail.com',
             subject: "Failed Pipeline: ${BUILD_NUMBER}",
            //  emailext attachLog: true, body: "${currentBuild.result}: ${BUILD_URL}", compressLog: true
             body: "Something is wrong with ${env.BUILD_URL}"
    }
     success {
       emailext attachLog: true, body: "${currentBuild.result}: ${BUILD_URL}", compressLog: true, replyTo: 'phaninani12374@gmail.com',
       subject: "Build Notification: ${JOB_NAME}-Build# ${BUILD_NUMBER} ${currentBuild.result}", to: 'phaninani12374@gmail.com'
    }
}
}
