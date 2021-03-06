class Iniciados.Views.BooksShowPage extends Backbone.View

	el: 'body'

	events:
		"keypress #current-page" : "goToPage"
		"click #prev-page" : "prevPage"
		"click #next-page" : "nextPage"
	maxPageWidth: 0
	
	currentPage: 0
	
	extension: ".jpg"
	
	startTouch: 0
	
	initialize: ->
		self = @
		
		@currentPage = parseInt gon.initial_page
		
		#webIniciados.checkCredentials(->
		#	self.renderImage self.currentPage
		#)
		
		self.renderImage self.currentPage
		
		@maxPageWidth = window.innerWidth
		
		$('#slider').slider
			slide: -> $('#book-content').css('width', parseInt(parseInt($('#slider').slider('value')) / 100 * self.maxPageWidth - 20) + 'px')
			change: -> $('#book-content').css('width', parseInt(parseInt($('#slider').slider('value')) / 100 * self.maxPageWidth - 20) + 'px')
			value: 100
			min: 10
			max: 100
	
		$("#slider .ui-slider-handle").unbind('keydown')
		
		$('#total-pages').html(' /' + gon.total_pages)
		
		document.body.addEventListener 'touchstart', ((e) ->
			self.startTouch = e.changedTouches[0].pageX
			target = $(e.target)
			if target.attr('id') is 'sections_container' || target.closest('#sections_container').size() != 0
				$('#sections_wrapper').css('transition', 'all, 0s')
				
		), false
		
		document.body.addEventListener 'touchmove', ((e) ->
			moveTouch = e.changedTouches[0].pageX
			target = $(e.target)
			if target.attr('id') is 'sections_container' || target.closest('#sections_container').size() != 0
				width = parseInt($('#sections_wrapper').css('width')) * -1
				movement = 4000
				if moveTouch < self.startTouch and $('#sections_wrapper').css('left') isnt "-" + $('#sections_wrapper').css('width')
					movement = moveTouch - self.startTouch
				else if moveTouch > self.startTouch and $('#sections_wrapper').css('left') isnt '0px'
					movement = width + moveTouch - self.startTouch
					
				if movement <= 0 and movement >= width
					$('#sections_wrapper').css('left', movement + "px")
		), false
		
		document.body.addEventListener 'touchend', ((e) ->
			endTouch = 	e.changedTouches[0].pageX
			target = $(e.target)
			$('#sections_wrapper').css('transition', 'all, 0.2s')
			if self.startTouch is endTouch and target.attr('id') isnt 'sections_container' and target.closest('#sections_container').size() is 0
				$('#sections_wrapper').css('left', "-" + $('#sections_wrapper').css('width'))
			else if target.attr('id') is 'sections_container' || target.closest('#sections_container').size() != 0
				if endTouch > self.startTouch + 20
					$('#sections_wrapper').css('left', "0px")
				else if endTouch > self.startTouch
					$('#sections_wrapper').css('left', "-" + $('#sections_wrapper').css('width'))
				else if endTouch < self.startTouch - 20
					$('#sections_wrapper').css('left', "-" + $('#sections_wrapper').css('width'))
				else
					$('#sections_wrapper').css('left', "0px")
		), false
		
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
		piecesDownloaded = 1
		i = 1
		while i <= 10
			do (i) ->
				oReq = new XMLHttpRequest
				oReq.open 'GET', gon.send_page_url + '?page=' +page+ '&portion=' + i + self.extension, true
				oReq.responseType = 'arraybuffer'
				oReq.onreadystatechange = (aEvt) ->
					if aEvt.target.readyState == 4 and aEvt.target.status == 200
						blob = new Blob([ aEvt.target.response ], type: 'image/jpeg')
						newImg = new Image()
						url = URL.createObjectURL(blob)
						newImg.src = url
						newImg.onload = ->
							URL.revokeObjectURL url
							pieces[i - 1] = newImg
							if piecesDownloaded is 10
								$('#book-content').html('')
								for piece in pieces
									console.log piece
									canvas = document.createElement('canvas')
									canvas.width = piece.width
									canvas.height = piece.height
									ctx = canvas.getContext("2d")
									ctx.drawImage(piece, 0, 0, canvas.width, canvas.height)
									$('#book-content').append(canvas)
								self.unlockButtons()
								$('#current-page').val(self.currentPage)
							++piecesDownloaded
					else
						if aEvt.target.status == 406
							location.reload()
						else if  aEvt.target.status != 200
							console.log 'Error loading page'
							console.log aEvt
						
				oReq.send()
			++i
		
		
		###
		$.getJSON("/contents/show_page", {file_path: gon.file_path + "/" + page}, (data) ->
			$('#book-content').html('')
			$('#current-page').val(page)
			console.log 'Here I am ' + data.length
			j = 0
			while j < data.length
				piece = data[j]
				img = new Image()
				binaryLength = piece.length
				ab = new ArrayBuffer(binaryLength)
				ua = new Uint8Array(ab)
				k = 0
				while k < length
				  ua[k] = piece.charCodeAt(k)
				  k++
				blob = new Blob([ ab ], type: 'image/jpeg')
				console.log URL.createObjectURL(blob)
				
				img.src = 'data:image/bmp;base64,' + ua
				canvas = document.createElement('canvas')
				canvas.width = img.width
				canvas.height = img.height
				ctx = canvas.getContext("2d")
				ctx.drawImage(img, 0, 0, canvas.width, canvas.height)
				$('#book-content').append(canvas)
				
				$('#book-content').append($('<img>', {src: URL.createObjectURL(blob)}))
				j++
				
			self.unlockButtons()
		).fail(->
			$('.failed-uploades').append('<p>Página </p>' + page)
		)
		###	
				
	nextPage: (e) ->
		if not $(e.target).closest('#move-page-wrapper').hasClass('inactive')
			@currentPage = @currentPage + 1
			@renderImage(@currentPage)
			$(window).scrollTop(0)
	
	prevPage: (e) ->
		if not $(e.target).closest('#move-page-wrapper').hasClass('inactive')
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
		$('#book-content').css('opacity', '0.6')
		$('#current-page').attr('disabled', 'disabled')
		$('#move-page-wrapper').addClass('inactive')
		
	unlockButtons: ->
		$('#book-content').css('opacity', '1')
		$('#current-page').removeAttr('disabled')
		$('#move-page-wrapper').removeClass('inactive')
			
			
			