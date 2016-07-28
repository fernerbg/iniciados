class Iniciados.Views.UsersHome extends Backbone.View

	el: 'body'

	video: document.querySelector('video')
	
	mimeCodec: 'video/mp4; codecs="avc1.42E01E, mp4a.40.2"'
	 
	initialize: ->
		self = this
		xhr = new XMLHttpRequest
		xhr.open 'get', 'videos/mov_bbb.mp4'
		xhr.responseType = 'blob'
	
		xhr.onload = ->
			console.log xhr.response
			video = document.getElementById('video');
			obj_url = window.URL.createObjectURL(xhr.response);
			video.src = obj_url;
			video.play()
			video.addEventListener "load", ->
				URL.revokeObjectURL(obj_url)
			return
	
		xhr.send()
			
		#if 'MediaSource' of window and MediaSource.isTypeSupported(self.mimeCodec)
		
		#	mediaSource = new MediaSource
			#console.log(mediaSource.readyState); // closed
		#	video = document.querySelector('video')
		#	video.src = URL.createObjectURL(mediaSource)
		#	mediaSource.addEventListener 'sourceopen', self.sourceOpen
		#else
		#	console.error 'Unsupported MIME type or codec: ', self.mimeCodec
	
	sourceOpen: (_) ->
		#console.log(this.readyState); // open
		mediaSource = this
		console.log(mediaSource)
		mimeCodec= 'video/mp4; codecs="avc1.42E01E, mp4a.40.2"'
		sourceBuffer = mediaSource.addSourceBuffer(mimeCodec)
		console.log(sourceBuffer)
		fetchAB= (url, cb) ->
			console.log url
			xhr = new XMLHttpRequest
			xhr.open 'get', url
			xhr.responseType = 'arraybuffer'
		
			xhr.onload = ->
				cb xhr.response
				return
		
			xhr.send()
			return
		fetchAB "videos/mov_bbb.mp4", (buf) ->
			sourceBuffer.addEventListener 'updateend', (_) ->
				mediaSource.endOfStream()
				video= document.querySelector('video')
				video.play()
				#console.log(mediaSource.readyState); // ended
				return
			sourceBuffer.appendBuffer buf
			return
		return