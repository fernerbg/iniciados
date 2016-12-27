class Iniciados.Views.UsersHome extends Backbone.View

	el: 'body'
	newWidth: 0
	
	events:
		"resize window" : "onResize"
		
	initialize: ->
		self = this
		@.newWidth = parseInt($('.new-wrapper:first').css('width'))
		@.setInfoProperties()
		@.setImageProperties()
		
	setImageProperties: ->
		if @.newWidth + 30 is window.innerWidth
			$('.new-wrapper .content-wrapper img').css({'width': '100%', 'position': 'static'})
		else
			$('.new-wrapper .content-wrapper img').each ->
				image = $(this)
				image.css({'width': 'auto', 'position': 'relative'})
				imageHeight = parseInt(image.css('height'))
				imageWidth = parseInt(image.css('width'))
				contentHeight = parseInt($('.new-wrapper:first .content-wrapper').css('height'))
				contentWidth = parseInt($('.new-wrapper:first .content-wrapper').css('width'))
				if imageHeight > contentHeight
					moveY = ((imageHeight - contentHeight) / 2) * -1
					image.css('top', moveY + 'px')
				if imageWidth > contentWidth
					moveX = ((imageWidth - contentWidth) / 2) * -1
					image.css('left', moveX + 'px')
	
	setInfoProperties: ->
		if @.newWidth + 30 is window.innerWidth
			$('.new-wrapper .information-wrapper').css('height', 'auto')
			$('.new-wrapper .content-wrapper').css('height', 'auto')
		else
			@.infoHeight = $('.new-wrapper:first .information-wrapper').css('width')
			$('.new-wrapper .information-wrapper').css('height', @.infoHeight)
			$('.new-wrapper .content-wrapper').css('height', @.infoHeight)
			myScroll = new IScroll('.new-wrapper .information-wrapper', {mouseWheel: true, scrollbars: true, scrollbars: 'custom'})
			
	onResize: ->
		infoHeight = $('.new-wrapper:first .information-wrapper').css('width')
		if infoHeight is not @.infoHeight
			@.infoHeight = infoHeight
			@.setInfoProperties
		
		newWidth = parseInt($('.new-wrapper:first').css('width'))
		if newWidth is not @.newWidth
			@.newWidth = newWidth
			@.setImageProperties
			
			