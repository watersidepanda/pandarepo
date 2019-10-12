node {
	def app
	
	stage('Clone the repo'){
		checkout scm
	}

	stage('Build Image'){
	    app = docker.build("watersidepanda/pandarepo")
	}

	stage('Test Image'){
	    aap.inside { sh 'echo "Test Passed"' }	
	}

	stage('Push Image') {
	    docker.withRegistry('https://hub.docker.com/','dockerHubCreds')
	    app.push("$(env.BUILD_NUMBER)")
	    app.push("latest")	
	}
