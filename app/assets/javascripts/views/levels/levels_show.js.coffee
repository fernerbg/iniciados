class Iniciados.Views.LevelsShow extends Backbone.View
	el: 'body'
	
	currentAudio: null
	
	timeInterval: null
	
	events:
		'click #book-content .close-icon' : 'closeBookContent'
		'click #audio-content .close-icon' : 'closeAudioContent'
		'click .main-link-below .border-bottom' : 'openBookContent'
		'click #audio-link' : 'openAudioContent'
		'click .play-audio' : 'playTrack'
		'click .stop-audio' : 'stopTrack'
		
	initialize: ->
		webIniciados.setAudioWaves()
		
	closeBookContent: (event) ->
		$('#book-content').fadeOut(200)
	
	openBookContent: (event) ->
		$('#book-content').fadeIn(200)
	
	closeAudioContent: (event) ->
		$('#audio-content').fadeOut(200)
	
	openAudioContent: (event) ->
		$('#audio-content').fadeIn(200)
	
	playTrack: (event) ->
		self = this
		if @currentAudio is not null
			@currentAudio.trigger('stop')
			clearInterval @timeInterval
		@currentAudio = $(event.target).closest('.audio-wrapper').find('.audio-player')
		@currentAudio.on('play', ->
			console.log 'start playing'
			$(this).closest('.duration').html(@currentAudio.duration)
		)
		@currentAudio.trigger('play')
		@timeInterval = setInterval (->
			currentAudio = self.currentAudio[0]
			currentWidth = currentAudio.currentTime / currentAudio.duration * 100
			self.currentAudio.closest('.audio-wrapper').find('.image-mask').css('width', currentWidth + "%")
		), 1000
		if $(event.target).hasClass('play-audio')
			playAudio =  $(event.target)
		else
			playAudio = $(event.target).closest('.play-audio')
			
		playAudio.hide()
		playAudio.next().show()
		
		
	stopTrack: (event) ->
		@currentAudio.trigger('pause')
		clearInterval @timeInterval
		if $(event.target).hasClass('stop-audio')
			stopAudio =  $(event.target)
		else
			stopAudio = $(event.target).closest('.stop-audio')
			
		stopAudio.hide()
		stopAudio.prev().show()
		