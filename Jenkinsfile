node {
	def app
	
	stage('Clone the repo'){
		checkout scm
	}

	stage('Build Image'){
	    app = docker.build("watersidepanda/pandarepo")
	}

	stage('Test Image'){
	    app.inside { sh 'echo "Test Passed"' }	
	}

	stage('Push Image') {
	    docker.withRegistry('https://hub.docker.com/r/watersidepanda/pandapubrepo','gitHubCreds')
	    app.push()
	}
}
