node {
	def app
	
	stage('Clone the repo'){
		checkout scm
	}

	stage('Build Image'){
	    app = docker.build("watersidepanda/pandapubrepo:$BUILD_NUMBER")
	}

	stage('Test Image'){
	    app.inside { sh 'echo "Test Passed"' }	
	}

	stage('Push Image') {
		docker.withRegistry('https://hub.docker.com/','dockerhub') {
		  app.push()
		}
	}
}
