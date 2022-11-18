node {
	def app
	stage('Clone repository') {
		git branch: 'main',
			url: 'https://github.com/001004sua/IntroduceGame.git'
	}
	stage('Build image') {
		app = docker.build("suajang/introduce_game")
	}
	stage('Test image') {
		app.inside {
			
		}
	}
	stage('Push image') {
		docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
			app.push("${env.BUILD_NUMBER}")
			app.push("latest")
		}
	}
}
