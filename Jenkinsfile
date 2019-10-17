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
	    docker.withRegistry('watersidepanda/pandapubrepo','dockerHubCreds','')
	    app.push("${env.BUILD_NUMBER}")
	    app.push("latest")	
	}
}
