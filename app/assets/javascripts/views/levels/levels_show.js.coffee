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
		'click .stop-audio' : 'onStopTrack'
		
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
		newCurrentAudio = $(event.target).closest('.audio-wrapper').find('.audio-player')
		if @currentAudio isnt null && @currentAudio isnt newCurrentAudio
			self.stopTrack @currentAudio.closest('.audio-wrapper').find('.play-audio')
			@currentAudio = newCurrentAudio
		
		@currentAudio = $(event.target).closest('.audio-wrapper').find('.audio-player')
		if typeof @currentAudio.find('source').html() is 'undefined'
			@currentAudio.html($('<source>', {src: gon.audio_stream_path + "?element=audio_track&id=" + @currentAudio.data('id')}))
		
		@currentAudio.on('play', ->
			$(this).closest('.audio-wrapper').find('.duration').html(webIniciados.toMMSS(this.duration))
			self.timeInterval = setInterval (->
				currentAudio = self.currentAudio[0]
				currentWidth = currentAudio.currentTime / currentAudio.duration * 100
				self.currentAudio.closest('.audio-wrapper').find('.image-mask').css('width', currentWidth + "%")
				self.currentAudio.closest('.audio-wrapper').find('.current-time').html(webIniciados.toMMSS(currentAudio.currentTime))
			), 1000
		)
		
		@currentAudio.trigger('play')
		
		if $(event.target).hasClass('play-audio')
			playAudio =  $(event.target)
		else
			playAudio = $(event.target).closest('.play-audio')
			
		playAudio.hide()
		playAudio.next().show()
		
		
	onStopTrack: (event) ->
		@stopTrack($(event.target))
		
	stopTrack: (target) ->
		@currentAudio.on('pause', ->
			clearInterval self.timeInterval
		)
		@currentAudio.trigger('pause')
		
		@currentAudio.off('play')
		@currentAudio.off('pause')
		
		if target.hasClass('stop-audio')
			stopAudio =  target
		else
			stopAudio = target.closest('.stop-audio')
			
		stopAudio.hide()
		stopAudio.prev().show()
		