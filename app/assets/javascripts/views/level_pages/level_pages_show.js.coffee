class Iniciados.Views.LevelPagesShow extends Backbone.View

	el: 'body'

	events:
		"keypress #current-page" : "goToPage"
		"click #prev-page" : "prevPage"
		"click #next-page" : "nextPage"
		
	maxPageWidth: 1280
	
	currentPage: 0
	
	extension: ".jpg"
	
	canvas: null
	
	initialize: ->
		self = @
		
		@currentPage = parseInt gon.initial_page
		
		webIniciados.checkCredentials(->
			self.renderImage self.currentPage
		)
		
		@maxPageWidth = window.innerWidth
		
		
		$('#slider').slider
			slide: -> $('#book-content').css('width', (parseInt($('#slider').slider('value')) / 100 * self.maxPageWidth - 20) + 'px')
			change: -> $('#book-content').css('width', (parseInt($('#slider').slider('value')) / 100 * self.maxPageWidth - 20) + 'px')
			value: 100
			min: 10
			max: 100
	
		$("#slider .ui-slider-handle").unbind('keydown')
		
		###
		$('img').on 'contextmenu', ->
			false
			
		$('canvas').on 'contextmenu', ->
			false
		###
	
	renderImage: (page) ->
		self = @
		self.lockButtons()
		pieces = []
		totalPieces = 4
		piecesDownloaded = 0
		i = 1
		while i <= totalPieces
			do (i) ->
				webIniciados.s3.getObject { Key: gon.path + page + "/" + i + self.extension}, (err, data) ->
					if err
						console.log err
					else
						pieces[i] = data.Body
						++piecesDownloaded
						if piecesDownloaded == totalPieces
							# READY TO RENDER
							$('#book-content').html('')
							$('#current-page').val(page)
							j = 1
							while j < pieces.length
								piece = pieces[j]
								img = new Image()
								img.src = 'data:image/jpeg;base64,' + btoa(piece)
								canvas = document.createElement('canvas')
								canvas.width = img.width
								canvas.height = img.height
								ctx = canvas.getContext("2d")
								ctx.drawImage(img, 0, 0, canvas.width, canvas.height)
								$('#book-content').append(canvas)
								j++
							self.unlockButtons()
			i++
				
				
	nextPage: (e) ->
		if not $(e.target).hasClass('inactive')
			@currentPage = @currentPage + 1
			@renderImage(@currentPage)
	
	prevPage: ->
		if not $(e.target).hasClass('inactive')
			@currentPage = @currentPage - 1
			@renderImage(@currentPage)
	
	goToPage: (e) ->
		if not $(e.target).hasClass('inactive')
			if e.keyCode == 13
				page = $('#current-page').val()
				@currentPage = parseInt(page) if not isNaN page
				@renderImage(@currentPage)	
		
		
	lockButtons: ->
		$('#book-content').css('opacity', '0.7')
		$('.pdf-input').addClass('inactive')
		
	unlockButtons: ->
		$('#book-content').css('opacity', '1')
		$('.inactive').removeClass('inactive')