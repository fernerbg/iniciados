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
			if (new Date()).valueOf() + 60000 * 5 >= (new Date(awsCredentials.expireTime)).valueOf()
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
			if (new Date()).valueOf() + 60000 * 5 >= (new Date(awsCredentials.expireTime)).valueOf()
				window.checkCredentials()
	
	$.fn.awsUploader = (location) ->
		$(this).on 'change', ->
			console.log 'here twice'
			$('.uploaded-pages').html('0')
			$('.failed-uploades').html('')
			$('.total-pages').html(this.files.length)
			uploadedPages = 0
			i = 0
			bookPieces = 0
			while i < this.files.length
				file = this.files[i]
				do (file, i) ->
					setTimeout (->
						fileName = file.name
						pageName = fileName.substr(fileName.length - 7)
						pageNumber = parseInt pageName
						if isNaN pageNumber
							pageName = fileName.substr(fileName.length - 6)
							pageNumber = parseInt pageName
							if isNaN pageNumber
								pageName = fileName.substr(fileName.length - 5)
								pageNumber = parseInt pageName
						
						if not isNaN pageNumber
							if FileReader
								fr = new FileReader
							
								fr.onload = ->
									image = new Image()
									image.src = fr.result
									
									piece = 1
									yPieces = 2
									xPieces = 2
									totalPieces = yPieces * xPieces
									uploadedPieces = 0
									y = 0
									while y < yPieces
										x = 0
										while x < xPieces
											canvas = document.createElement('canvas')
											widthOfOnePiece = image.width / xPieces
											heightOfOnePiece = image.height / yPieces
											canvas.width = widthOfOnePiece
											canvas.height = heightOfOnePiece
											context = canvas.getContext('2d')
											context.drawImage image, x * widthOfOnePiece, y * heightOfOnePiece, widthOfOnePiece, heightOfOnePiece, 0, 0, canvas.width, canvas.height
											do (x, canvas, pageNumber, piece) ->
												dataUrl = canvas.toDataURL('image/jpeg')
												d = dataUrl.substr(dataUrl.indexOf('base64,') + 7)
												pageKey = location + pageNumber + "/" + piece + ".jpg"
												console.log 'sending page ' + pageNumber + ' piece ' + piece
												webIniciados.s3.upload {
													Key: pageKey
													Body: atob(d)
													ACL: 'authenticated-read'
												}, (err, data) ->
													if err
														$('.failed-uploades').append('<p>Página </p>' + pageNumber)
														return console.log('There was an error uploading your photo: ', JSON.stringify(err))
													else
														++uploadedPieces
														if uploadedPieces == totalPieces
															uploadedPages++
															$('.uploaded-pages').html(uploadedPages)
															console.log 'page ' + pageNumber + ' uploaded'
													return	    	
												
										
											++x
											++piece
											++bookPieces
										++y
								fr.readAsDataURL file
					), 15000 * i			
					
				i++
		
	
	publicContent =
		checkCredentials: checkCredentials
		updateCredentials: updateCredentials
		s3: null
		
	return	publicContent

