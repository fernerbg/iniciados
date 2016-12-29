class Iniciados.Views.ContentsShowPage extends Backbone.View

	el: 'body'

	events:
		"keypress #current-page" : "goToPage"
		"click #prev-page" : "prevPage"
		"click #next-page" : "nextPage"
		
	maxPageWidth: 0
	
	currentPage: 0
	
	extension: ".jpg"
	
	initialize: ->
		self = @
		
		@currentPage = parseInt gon.initial_page
		
		#webIniciados.checkCredentials(->
		#	self.renderImage self.currentPage
		#)
		
		self.renderImage self.currentPage
		
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
		$.getJSON("/contents/show_page", {file_path: gon.file_path + "/" + page}, (data) ->
			$('#book-content').html('')
			$('#current-page').val(page)
			console.log 'Here I am ' + data.length
			j = 0
			while j < data.length
				piece = data[j]
				img = new Image()
				img.src = piece
				canvas = document.createElement('canvas')
				canvas.width = img.width
				canvas.height = img.height
				ctx = canvas.getContext("2d")
				ctx.drawImage(img, 0, 0, canvas.width, canvas.height)
				$('#book-content').append(canvas)
				j++
				
			self.unlockButtons()
		).fail(->
			$('.failed-uploades').append('<p>Página </p>' + page)
		)
			
				
	nextPage: (e) ->
		if not $(e.target).hasClass('inactive')
			@currentPage = @currentPage + 1
			@renderImage(@currentPage)
			$(window).scrollTop(0)
	
	prevPage: (e) ->
		if not $(e.target).hasClass('inactive')
			@currentPage = @currentPage - 1
			@renderImage(@currentPage)
			$(window).scrollTop(0)
	goToPage: (e) ->
		if not $(e.target).hasClass('inactive')
			if e.keyCode == 13
				page = $('#current-page').val()
				@currentPage = parseInt(page) if not isNaN page
				@renderImage(@currentPage)	
				$(window).scrollTop(0)
		
	lockButtons: ->
		$('#book-content').css('opacity', '0.7')
		$('.pdf-input').addClass('inactive')
		
	unlockButtons: ->
		$('#book-content').css('opacity', '1')
		$('.inactive').removeClass('inactive')