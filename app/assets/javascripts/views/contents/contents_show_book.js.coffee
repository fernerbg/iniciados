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

  initialize: ->
  	self = @
  	@lastPage = parseInt $('#book-page').data('total-pages') - 1
  	@requestChunk(
  		0,
  		(data) ->
  				self.book = data.images
  				$('#book-page').attr 'src', self.book[0]
  				$('#book-page').show())

  	$('#slider').slider({
				slide: -> $('#book-page').css('width', (parseInt($('#slider').slider('value')) / 100 * self.maxPageWidth) + 'px')
				change: -> $('#book-page').css('width', (parseInt($('#slider').slider('value')) / 100 * self.maxPageWidth) + 'px')
				value: 80
				min: 20
				max: 100
			})

			$("#slider .ui-slider-handle").unbind('keydown')
		
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

		  if @currentPage is 20
		  	@book.splice(0, 10)
		  	@currentPage = 10
		  	@currentChunk++

		  @changePage()

  prevPage: ->
  	self = @
  	if @currentPage + @currentChunk * @chunkSize > 0
	  	@currentPage = @currentPage - 12
	  	if @currentPage is 3 && @currentChunk > 0
		  	@requestChunk(
		  		@currentChunk - 1,
		  		(data) ->
	  				self.book.unshift.apply(self.book, data.images)
	  				self.currentPage = self.currentPage + self.chunkSize
	  				console.log("Down new CurrentPage: " + self.currentPage)
	  				self.currentChunk--)
		  
		  if @currentPage is 9
		  	@book.splice(20, 10)

		  @changePage()

  goToPage: (event) ->
			if event.keyCode is 13
				newPage = parseInt $('#current-page').val()
				if newPage >= 1 && newPage <= (@lastPage + 1)
					@currentPage = newPage - 1
					@changePage()
				else
					$('#current-page').val(@currentPage + 1)

				$('#current-page').blur()

		changePage: ->
			$('#book-page').attr 'src', @book[@currentPage]
			$('#current-page').val(@currentPage + @currentChunk * @chunkSize + 1)
			$("html, body").scrollTop(0)

		requestChunk: (chunk, callback) ->
			self = @
			jqxhr = $.post(
	  		'delivery_pages.json',
	  		{
	  			title: $('#book-page').data('title')
	  			chunk_size: self.chunkSize
	  			offset: self.chunkSize * chunk
	  		},
	  		((data) ->
			  	callback(data)
				))

	  notAllowMenu: ->
		  return false