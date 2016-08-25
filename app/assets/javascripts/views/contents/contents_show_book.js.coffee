class Iniciados.Views.ContentsShowBook extends Backbone.View

  el: 'body'

  events:
  	"click #next-page": "nextPage"
  	"click #prev-page": "prevPage"
  	"keypress #current-page": "goToPage"
  	#contextmenu: "notAllowMenu"

  currentPage: 0
  
  lastPage: 0

  chunkSize: 10

  currentChunk: 0

  maxPageWidth: 1280

  book: []

  prevPages: []

  loading: false

  waitingConfirmation: false

  confirmationFunction: null

  initialize: ->
  	self = @
  	$('#slider').slider({
				slide: -> $('#book-page').css('width', (parseInt($('#slider').slider('value')) / 100 * self.maxPageWidth) + 'px')
				change: -> $('#book-page').css('width', (parseInt($('#slider').slider('value')) / 100 * self.maxPageWidth) + 'px')
				value: 80
				min: 20
				max: 100
			})
	
			$("#slider .ui-slider-handle").unbind('keydown')
  	###
  	
  	@lastPage = parseInt $('#book-page').data('total-pages') - 1
  	@requestChunk(
  		0,
  		(data) ->
  				self.book = data.images
  				$('#book-page').attr 'src', self.book[0]
  				$('#loading').hide()
  				$('#book-page').show())
		###
		
  nextPage: ->
  	self = @
  	if @currentPage + @currentChunk * @chunkSize < @lastPage
	  	@currentPage = @currentPage + 1
	  	if @currentChunk * @chunkSize < @lastPage
	  		if @currentPage is 17 && @book.length <= @chunkSize * 2
	  			@requestChunk(
			  		@currentChunk + 2,
			  		(data) ->
			  			self.book.push.apply(self.book, data.images))

	  		else if @currentPage is 7 && @book.length <= @chunkSize
			  	@requestChunk(
			  		@currentChunk + 1,
			  		(data) ->
			  			self.book.push.apply(self.book, data.images))

		  if @currentPage is 20 || (@currentPage is 10 &&  @book.length == @chunkSize)
		  	@chunkLoaded(
		  		->
		  			self.book.splice(0, 10)
				  	self.currentPage = 10
				  	self.currentChunk++)

		  @changePage()

  prevPage: ->
  	self = @
  	if @currentPage + @currentChunk * @chunkSize > 0
	  	@currentPage = @currentPage - 1
	  	if @currentPage is 3 && @currentChunk > 0
		  	@requestChunk(
		  		@currentChunk - 1,
		  		(data) ->
	  				self.book.unshift.apply(self.book, data.images)
	  				self.currentPage = self.currentPage + self.chunkSize
	  				self.currentChunk--)
		  
		  if @currentPage is 9
		  	@chunkLoaded(
		  		->
		  			self.book.splice(20, 10))
		  	

		  @changePage()

  goToPage: (event) ->
			if event.keyCode is 13
				newPage = parseInt $('#current-page').val()
				
				if newPage >= 1 && newPage <= @lastPage + 1
					newChunk = parseInt(newPage / @chunkSize)
					
					if @currentChunk == newChunk
						newPage = newPage % @chunkSize - 1
						@currentPage = newPage
						
						@changePage()
						@setBookState()

					else if newChunk == @currentChunk + 1 && @book.length > @chunkSize
						newPage = newPage % @chunkSize - 1 + @chunkSize
						@currentPage = newPage
						
						@changePage()
						@setBookState()

					else if newChunk == @currentChunk + 2 && @book.length > @chunkSize * 2
						newPage = newPage % @chunkSize - 1 + @chunkSize * 2
						@currentPage = newPage
						@book.splice(0, 10)
						
						@changePage()
						@setBookState()

					else
						self = @
						newPage = newPage % @chunkSize - 1
						@requestChunk(
				  		newChunk,
				  		(data) ->
			  				self.book = data.images
			  				self.currentPage = newPage
			  				self.currentChunk = newChunk)
						@chunkLoaded(
							->
								self.changePage()
								self.setBookState())
				else
					$('#current-page').val(@currentPage + 1)

				$('#current-page').blur()

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