class Iniciados.Views.LevelPagesShow extends Backbone.View

	el: 'body'

	events:
		"click #next-page": "nextPage"
		"click #prev-page": "prevPage"
		"keypress #current-page": "goToPage"
		contextmenu: "notAllowMenu"

	maxPageWidth: 1280

	loading: false
	
	lastPage: 0

	initialize: ->
		self = @
		
		@maxPageWidth = window.innerWidth
		
		$('#slider').slider
			slide: -> $('#book-page').css('width', (parseInt($('#slider').slider('value')) / 100 * self.maxPageWidth - 20) + 'px')
			change: -> $('#book-page').css('width', (parseInt($('#slider').slider('value')) / 100 * self.maxPageWidth - 20) + 'px')
			value: 80
			min: 20
			max: 100
	
		$("#slider .ui-slider-handle").unbind('keydown')
		
		$('img').on 'contextmenu', ->
			false

		@lastPage = parseInt $('#book-page').data('total-pages') - 1
		
		@requestPage $('#book-page').data('page')
		
		###
		@requestChunk(
			0,
			(data) ->
					self.book = data.images
					$('#book-page').attr 'src', self.book[0]
					$('#loading').hide()
					$('#book-page').show())
		###
	
	requestPage: (page, callback) ->
		self = @
		canvas = $('#book-page')
		canvas.css('opacity', '0.7')
		$('.pdf-input').addClass('inactive')
		data = { number: page }
		url = canvas.data('url')
		$.ajax
			method: 'POST'
			url: 'show_book'
			dataType: 'json'
			data: data
			success: (data) ->
				img = new Image()
				img.src = data.image
				###
				console.log img.height
				console.log img.width
				imgRatio = img.height / img.width
				imgHeight = window.innerWidth * imgRatio
				console.log imgHeight
				console.log window.innerWidth
				###
				canvas = $('#book-page')
				ctx = canvas[0].getContext("2d")
				ctx.clearRect(0, 0, canvas[0].width, canvas[0].height)
				ctx.drawImage(img, 0, 0, canvas[0].width, canvas[0].height)
				canvas.css('opacity', '1')
				$('.inactive').removeClass('inactive')
				callback() if typeof callback is 'function'
				return
			error: ->
				console.log 'AWWW!'
				return
	
	nextPage: (event) ->
		if not $(event.target).hasClass 'inactive'
			canvas = $('#book-page')
			totalPages = canvas.data('total-pages')
			currentPage = canvas.data('page')
			nextPage = currentPage + 1
			if totalPages > currentPage
				@requestPage nextPage, ->
					$('#current-page').val nextPage
					canvas.data 'page', nextPage
				

	prevPage: (event) ->
		if not $(event.target).hasClass 'inactive'
			canvas = $('#book-page')
			totalPages = canvas.data('total-pages')
			currentPage = canvas.data('page')
			prevPage = currentPage - 1
			if currentPage > 1
				@requestPage prevPage, ->
					$('#current-page').val prevPage
					canvas.data 'page', prevPage

	goToPage: (event) ->
		if not $(event.target).hasClass 'inactive'
			if event.keyCode is 13
				canvas = $('#book-page')
				currentPageInput = $(event.target)
				newPage = parseInt currentPageInput.val()
				if newPage >= 1 && newPage <= canvas.data('total-pages')
					@requestPage newPage, ->
						currentPageInput.val newPage
						canvas.data 'page', newPage
				else
					currentPageInput.val(canvas.data('page'))
					
				currentPageInput.blur()
	
	changePage: ->
		$('#book-page').attr 'src', @book[@currentPage]
		$('#current-page').val(@currentPage + @currentChunk * @chunkSize + 1)
		$("html, body").scrollTop(0)
	
	requestChunk: (chunk, callback) ->
		self = @
		@loading = true
		data =  { title: $('#book-page').data('title'), chunk_size: self.chunkSize, offset: self.chunkSize * chunk }
		$.ajax
			method: 'POST'
			url: 'delivery_pages.json'
			dataType: 'json'
			data: data
			success: (data) ->
				d = new Date()
				console.log(d.getSeconds())
				callback(data)
				self.closeLoading()
				return
			error: ->
				console.log 'AWWW!'
				return
			xhr: ->
				xhr = new (window.XMLHttpRequest)
				xhr.addEventListener 'progress', ((evt) ->
					if evt.lengthComputable
						d = new Date()
						console.log(d.getSeconds())
						percentComplete = evt.loaded / evt.total
						$('#loading-progress .progress-bar').css("width",  percentComplete * 100 + "%")
						$('#loading-progress .progress-bar').html(parseInt(percentComplete * 100) + "%")
					return
				), false
				xhr
				
	closeLoading: ->
		@loading = false
		if @waitingConfirmation
			@confirmationFunction()
			@waitingConfirmation = false
			$('#book-page').show()
			$('#loading').hide()
			$('#transparency').css('top', '44px')
			$('#navigation-options').css('opacity', '1')

	setBookState: ->
		self = @
		if @currentPage >= 17 && @book.length <= @chunkSize * 2
			@requestChunk(
				@currentChunk + 2,
				(data) ->
					self.book.push.apply(self.book, data.images))

		else if @currentPage >= 7 && @book.length <= @chunkSize
			@requestChunk(
				@currentChunk + 1,
				(data) ->
					self.book.push.apply(self.book, data.images))

		if @currentPage is 20
			@book.splice(0, 10)
			@currentPage = 10
			@currentChunk++

		if @currentPage <= 3 && @currentChunk > 0
			@requestChunk(
				@currentChunk - 1,
				(data) ->
					self.book.unshift.apply(self.book, data.images)
					self.currentPage = self.currentPage + self.chunkSize
					self.currentChunk--)
		
		if @currentPage <= 9
			@book.splice(20, 10)

	chunkLoaded: (callback) ->
		if @loading
			@waitingConfirmation = true
			@confirmationFunction = callback
			$('#book-page').hide()
			$('#loading').show()
			$('#transparency').css('top', '0px')
			$('#navigation-options').css('opacity', '0.5')
		else
			callback()

	notAllowMenu: ->
		return false