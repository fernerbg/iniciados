class Iniciados.Views.LevelPagesShow extends Backbone.View

	el: 'body'

	events:
		"keypress #current-page": "goToPage"
		"ajax:send #prev-page, #next-page": "lockButtons"
		
	maxPageWidth: 1280

	loading: false
	
	lastPage: 0
	
	currentPage: 0
	
	canvas: null

	initialize: ->
		self = @
		
		@canvas = $('#book-page')
		
		@currentPage = parseInt $('#current-page').val()
		
		@renderImage gon.image
		
		$('#prev-page').on("ajax:success", (e, data, status, xhr) ->
			self.renderImage(data.image)
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

		@lastPage = parseInt @canvas.data('total-pages') - 1
		
	
	renderImage: (image) ->
		img = new Image()
		img.src = image
		canvas = @canvas
		ctx = canvas[0].getContext("2d")
		ctx.clearRect(0, 0, canvas[0].width, canvas[0].height)
		ctx.drawImage(img, 0, 0, canvas[0].width, canvas[0].height)
	
	lockButtons: ->
		@canvas.css('opacity', '0.7')
		$('.pdf-input').addClass('inactive')
		
	unlockButtons: (prev_link, next_link) ->
		$('#next-page').attr('href', next_link)
		$('#prev-page').attr('href', prev_link)
		@canvas.css('opacity', '1')
		$('.inactive').removeClass('inactive')