   try {
        stage('Git Checkout'){
            node{ 
			cleanWs()
			checkout scm
		          }
	                 }
        stage('Terraform Init'){   
            node {
           withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', 
		   accessKeyVariable: 'AWS_ACCESS_KEY_ID', 
		   credentialsId: 'AWS_Creadentials_Anuj', 
		   secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) 
                {sh 'terraform init'}
                 }
			}
        stage('Terraform Plan'){
            node {
           withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', 
		   accessKeyVariable: 'AWS_ACCESS_KEY_ID', 
		   credentialsId: 'AWS_Creadentials_Anuj', 
		   secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']])
               {sh 'terraform plan'} 
            }
			}
        stage('Terraform Apply'){
            node {
           withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', 
		   accessKeyVariable: 'AWS_ACCESS_KEY_ID', 
		   credentialsId: 'AWS_Creadentials_Anuj', 
		   secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']])
                {sh 'terraform apply --auto-approve'}
            }
        }
         stage('Terraform Show'){
            node {
           withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', 
		   accessKeyVariable: 'AWS_ACCESS_KEY_ID', 
		   credentialsId: 'AWS_Creadentials_Anuj', 
		   secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']])
                {sh 'terraform show'}
            }
        }
		currentBuild.result= 'SUCCESS'
    }
   catch (org.jenkinsci.plugin.workflow.steps.FlowInterruptedException flowError) 
   {
   currentBuild.result= 'ABORTED'
   }
   catch (err) 
   {
   currentBuild.result= 'FAILURE'
   throw err
   }
   finally
   {
   if(currentBuild.result= 'SUCCESS')
   {
   currentBuild.result= 'SUCCESS'
   }
   }
