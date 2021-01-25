    agent any
    tools { terraform 'Terraform-12' }
    try{
        stage('Git Checkout'){
            steps{
                checkout scm
            }
			}
        stage('Terraform Init'){   
            steps{
           withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', 
		   accessKeyVariable: 'AWS_ACCESS_KEY_ID', 
		   credentialsId: 'AWS_Creadentials_Anuj', 
		   secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) 
                {sh 'terraform init'}
                 }
			}
        stage('Terraform Plan'){
            steps{
           withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', 
		   accessKeyVariable: 'AWS_ACCESS_KEY_ID', 
		   credentialsId: 'AWS_Creadentials_Anuj', 
		   secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']])
               {sh 'terraform plan'} 
            }
			}
        stage('Terraform Apply'){
            steps{
           withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', 
		   accessKeyVariable: 'AWS_ACCESS_KEY_ID', 
		   credentialsId: 'AWS_Creadentials_Anuj', 
		   secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']])
                {sh 'terraform apply --auto-approve'}
            }
        }
         stage('Terraform Show'){
            steps{
           withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', 
		   accessKeyVariable: 'AWS_ACCESS_KEY_ID', 
		   credentialsId: 'AWS_Creadentials_Anuj', 
		   secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']])
                {sh 'terraform show'}
            }
        }
    }
