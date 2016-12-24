class Iniciados.Views.LevelPagesNew extends Backbone.View

	el: 'body'
	
	totalPages: 0
	
	uploadedPages: 0
	
	initialize: ->
		self = @
		
		webIniciados.checkCredentials()		
		
		$('#new_level_page').click ->
			self.totalPages = 0
			self.uploadedPages = 0
			$('.total-pages').html('0')
			$('.uploaded-pages').html('0')
			$('.failed-uploades').html('')
		
		$('#image').on 'change', ->
			$('.total-pages').html(this.files.length)
			levelName = $('#level_id').val()
			location = "levels/" + levelName + "/book/"
			i = 0
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
					pageKey = location + pageNumber + ".jpg"
					webIniciados.s3.upload {
						Key: pageKey
						Body: file
						ACL: 'authenticated-read'
					}, (err, data) ->
						if err
							return console.log('There was an error uploading your photo: ', JSON.stringify(err))
						self.uploadedPages++
						$('.uploaded-pages').html(self.uploadedPages)
						console.log(data)
						return
				i++
						
		###	
		$('#new_level_page').on('change', ->
			dataType: "json"
			add: (e, data) ->
				self.totalPages = self.totalPages + 1
				$('.total-pages').html(self.totalPages)
				fileName = data.files[0].name
				console.log(data.files[0])
				pageName = fileName.substr(fileName.length - 7)
				pageNumber = parseInt pageName
				if isNaN pageNumber
					pageName = fileName.substr(fileName.length - 6)
					pageNumber = parseInt pageName
					if isNaN pageNumber
						pageName = fileName.substr(fileName.length - 5)
						pageNumber = parseInt pageName
				
				if not isNaN pageNumber
					$('#level_page_number').val(pageNumber)
					imagePieces = []
					
				if FileReader and data.files and data.files.length
					console.log 'all is good'
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
						    imagePieces.push atob(canvas.toDataURL())
						    ++x
						  ++y
						
						fileName = data.files[0]
						$.ajax
							type: 'POST'
							data: pieces: imagePieces
							url: $()
							success: (msg) ->
								console.log msg
								self.uploadedPages = self.uploadedPages + 1
								$('.uploaded-pages').html(self.uploadedPages)
								return
					
					fr.readAsDataURL data.files[0]
		)	
		
					#data.submit()
		
			success: (data) ->
				if data == null
					$('.failed-uploades').append('<li>' + data.number + '</li>')
				else
					self.uploadedPages = self.uploadedPages + 1
					$('.uploaded-pages').html(self.uploadedPages)
		###