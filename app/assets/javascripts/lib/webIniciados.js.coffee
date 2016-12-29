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
		console.log 'TODO'
	
	updateCredentials = ->
		console.log 'TODO'
	
	$.fn.awsUploader = () ->
		$(this).on 'change', ->
			controller = $('body').data('controller')
			switch controller
				when 'lessons'
					location = "lessons/" + $('#lesson_id').val() + "/reading/"
				when 'level_pages'
					filePath = $('#level_id').val() + "/book/"
				else
					console.log 'not location'
					return false
			
			$('.uploaded-pages').html('0')
			$('.failed-uploades').html('')
			$('.total-pages').html(this.files.length)
			uploadedPages = 0
			i = 0
			bookPieces = 0
			while i < this.files.length
				file = this.files[i]
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
					((file, pageNumber) ->
						imagePieces = []
						if FileReader
							fr = new FileReader
						
							fr.onload = ->
								image = new Image()
								image.src = fr.result
								y = 0
								while y < 10
								  x = 0
								  while x < 10
								    canvas = document.createElement('canvas')
								    widthOfOnePiece = image.width / 10
								    heightOfOnePiece = image.height / 10
								    canvas.width = widthOfOnePiece
								    canvas.height = heightOfOnePiece
								    context = canvas.getContext('2d')
								    context.drawImage image, x * widthOfOnePiece, y * heightOfOnePiece, widthOfOnePiece, heightOfOnePiece, 0, 0, canvas.width, canvas.height
								    dataUrl = canvas.toDataURL('image/jpeg')
								    console.log dataUrl.substr(dataUrl.indexOf('base64,') + 7)
								    imagePieces.push(dataUrl.substr(dataUrl.indexOf('base64,') + 7))
								    #imagePieces.push atob(dataUrl.substr(dataUrl.indexOf('base64,') + 7))
								    ++x
								  ++y
								
								$.ajax
									type: 'POST'
									data: pieces: imagePieces, file_path: filePath + "/" + pageNumber
									url: gon.upload_path
									dataType: "json"
									success: (msg) ->
										console.log msg
										++self.uploadedPages
										$('.uploaded-pages').html(self.uploadedPages)
										return
							
							fr.readAsDataURL file
					)(file, pageNumber)
	
					
				i++
		
	
	publicContent =
		checkCredentials: checkCredentials
		updateCredentials: updateCredentials
		s3: null
		
	return	publicContent

