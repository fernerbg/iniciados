window.webIniciados = do ->
	
	s3 = null
	bucketName = 'iniciados-dev'
	
	refreshCognitoToken = (callback) ->
		try
			console.log 'inside'
			$.get '/users/get_cognito_token.json', (data) ->
				params = 
					IdentityPoolId: data.identity_pool_id
					IdentityId: data.aws_credentials.identity_id
					Logins: 'cognito-identity.amazonaws.com': data.aws_credentials.token
				AWS.config.region = 'us-west-2'
				AWS.config.credentials = new (AWS.CognitoIdentityCredentials)(params)
				AWS.config.credentials.get ->
					awsCredentials = 
						accessKeyId: AWS.config.credentials.accessKeyId
						secretAccessKey: AWS.config.credentials.secretAccessKey
						sessionToken: AWS.config.credentials.sessionToken
						accessKeyId: AWS.config.credentials.accessKeyId
						expireTime: AWS.config.credentials.expireTime
						
					localStorage.awsCredentials = JSON.stringify(awsCredentials)
					
					publicContent.s3 = new AWS.S3
					  params: {Bucket: bucketName}
					  
					callback() if typeof callback == 'function'
		catch e
			console.log e
	
	checkCredentials = (callback) ->
		if typeof localStorage.awsCredentials is 'undefined'
			refreshCognitoToken(callback)
		else
			awsCredentials = JSON.parse localStorage.awsCredentials
			if (new Date()).valueOf() + 60000 * 5 >= awsCredentials.expireTime.valueOf()
				refreshCognitoToken(callback)
			else
				AWS.config.region = 'us-west-2'
				AWS.config.credentials = new AWS.Credentials awsCredentials
				publicContent.s3 = new AWS.S3
				  params: {Bucket: bucketName}
				callback() if typeof callback == 'function'
	
	updateCredentials = ->
		if typeof localStorage.awsCredentials is not 'undefined' and localStorage.awsCredentials is not null
			awsCredentials = JSON.parse localStorage.awsCredentials
			if (new Date()).valueOf() + 60000 * 5 >= awsCredentials.expireTime.valueOf()
				window.checkCredentials()
				
	publicContent =
		checkCredentials: checkCredentials
		updateCredentials: updateCredentials
		s3: null
		
	return	publicContent

