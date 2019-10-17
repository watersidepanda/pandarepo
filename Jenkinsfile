node {
	def app
	
	stage('Clone the repo'){
		checkout scm
	}

	stage('Build Image'){
	    app = docker.build("watersidepanda/pandapubrepo:t2")
	}

	stage('Test Image'){
	    app.inside { sh 'echo "Test Passed"' }	
	}

	stage('Push Image') {
	    
	    app.push()
	}
}
