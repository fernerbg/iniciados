class Iniciados.Views.LevelPagesShow extends Backbone.View

	el: 'body'

	events:
		"keypress #current-page" : "goToPage"
		"click #prev-page" : "prevPage"
		"click #next-page" : "nextPage"
		
	maxPageWidth: 1280
	
	currentPage: 0
	
	canvas: null

	initialize: ->
		self = @
		
		@currentPage = parseInt $('#current-page').val()
		
		@renderImage gon.pieces
		
		$('#prev-page').on("ajax:success", (e, data, status, xhr) ->
			self.renderImage(data.pieces)
			self.unlockButtons(data.prev_link, data.next_link)
			self.currentPage--
			$('#current-page').val(self.currentPage)
		)
		
		$('#next-page').on("ajax:success", (e, data, status, xhr) ->
			self.renderImage(data.image)
			self.unlockButtons(data.prev_link, data.next_link)
			self.currentPage++
			$('#current-page').val(self.currentPage)
		)
		
		@maxPageWidth = window.innerWidth
		
		$('#slider').slider
			slide: -> self.canvas.css('width', (parseInt($('#slider').slider('value')) / 100 * self.maxPageWidth - 20) + 'px')
			change: -> self.canvas.css('width', (parseInt($('#slider').slider('value')) / 100 * self.maxPageWidth - 20) + 'px')
			value: 80
			min: 20
			max: 100
	
		$("#slider .ui-slider-handle").unbind('keydown')
		
		$('img').on 'contextmenu', ->
			false
		
	
	renderImage: (pieces) ->
		arrangePieces = []
		i = 0
		while i < pieces.length
			piece = pieces[i]
			pieceNumber = parseInt(piece.name.split("piece_")[1])
			arrangePieces[pieceNumber] = piece.data
			i++
		
		i = 0
		while i < arrangePieces.length
			piece = arrangePieces[i]
			img = new Image()
			img.src = piece
			canvas = document.createElement('canvas')
			canvas.width = img.width
			canvas.height = img.height
			ctx = canvas.getContext("2d")
			ctx.drawImage(img, 0, 0, canvas.width, canvas.height)
			$('#book-content').append(canvas)
			i++
			
	lockButtons: ->
		$('#container').css('opacity', '0.7')
		$('.pdf-input').addClass('inactive')
		
	unlockButtons: (prev_link, next_link) ->
		$('#next-page').attr('href', next_link)
		$('#prev-page').attr('href', prev_link)
		$('#container').css('opacity', '1')
		$('.inactive').removeClass('inactive')