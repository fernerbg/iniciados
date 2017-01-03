window.webIniciados = do ->
	
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
			filePath = $('#element').val() + "/pages/"
			
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
										imagePieces.push(dataUrl.substr(dataUrl.indexOf('base64,') + 7))
										++x
									++y
								
								$.ajax
									type: 'POST'
									data: pieces: imagePieces, file_path: filePath + "/" + pageNumber, element: gon.element
									url: gon.upload_path
									dataType: "json"
									success: (msg) ->
										console.log msg
										++uploadedPages
										$('.uploaded-pages').html(uploadedPages)
										return
							
							fr.readAsDataURL file
					)(file, pageNumber)
	
				i++
		
	setAudioWaves = ->
		$('.wave-image').load ->
			$('.top-content-wrapper.audio-content').css({visibility: 'hidden', display: 'block'})
			audioWrapper = $(this).closest('.audio-wrapper')
			opacityHeight = parseInt audioWrapper.find('.audio-wave').css('height') * 0.3
			audioWrapper.find('.opacity-maker').css({top: opacityHeight * -1 + 6, height: (opacityHeight - 6) + 'px'})
			canvas = document.createElement('canvas')
			img = new Image()
			img.src = $(this).attr('src')
			canvas.width = img.width
			canvas.height = img.height
			ctx = canvas.getContext('2d')
			ctx.drawImage(img, 0, 0)
			ctx.fillStyle = "rgb(255, 0, 0)"
			ctx.globalCompositeOperation = "source-in"
			ctx.fillRect(0, 0, img.width, img.height)
			ctx.restore()
			imgMask = $(this).parent().find('.image-mask')
			imgMask.css({'background-image': 'url(' + canvas.toDataURL() + ')', height: this.height, 'background-size': this.width + 'px ' + this.height + 'px'})
				
			$('.top-content-wrapper.audio-content').css({visibility: 'visible', display: 'none'})
	
	
	toMMSS = (seconds) ->
		minutes = Math.floor(seconds / 60)
		seconds = parseInt(seconds - minutes * 60)
		minutes = "0"+minutes if minutes < 10
		seconds = "0"+seconds if seconds < 10

		return minutes+':'+seconds
		
	publicContent =
		checkCredentials: checkCredentials
		updateCredentials: updateCredentials
		setAudioWaves: setAudioWaves
		toMMSS: toMMSS
		
	return	publicContent
