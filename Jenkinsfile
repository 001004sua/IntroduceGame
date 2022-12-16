pipeline {
  agent any
  environment {
    PROJECT_ID = 'oss2022'
    CLUSTER_NAME = 'kube'
    LOCATION = 'asia-northeast3-a'
    CREDENTIALS_ID = 'gke'
  }
  stages{
    stage('Clone repository') {
      steps {
        git branch: 'develop',
        url: 'https://github.com/001004sua/IntroduceGame.git'
      }
    }
    stage('Build image') {
      steps {
   script {
          app = docker.build("suajang/introduce_game:${env.BUILD_ID}")
   }
      }
    }
    stage('push image') {
      steps {
        script {
     docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
            app.push("${env.BUILD_ID}")
            app.push("latest")
     }
        }
      }
    }   
    stage('Deploy to GKE') {
      when {
        branch 'main'
      }
      steps{
   sh "sed -i 's/introduce_game:latest/introduce_game:${env.BUILD_ID}/g' Deployment.yaml"
        step([$class: 'KubernetesEngineBuilder', projectId: env.PROJECT_ID, clusterName: env.CLUSTER_NAME, location: env.LOCATION, manifestPattern: 'Deployment.yaml', credentialsId: env.CREDENTIALS_ID, verifyDeployments: true])
     }
   }
 }
}
