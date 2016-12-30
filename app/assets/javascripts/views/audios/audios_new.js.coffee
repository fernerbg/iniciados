class Iniciados.Views.AudiosNew extends Backbone.View
	el: 'body'
	
	events:
		'change #audio_track' : 'createWave'
		
	createWave: (event) ->
		canvasWidth = 1800
		canvasHeight = 260
		mirrorHeight = 70
		SoundCloudWaveform.generate event.target.files[0],
			canvas_width: canvasWidth
			canvas_height: canvasHeight - mirrorHeight
			bar_width: 10
			wave_color: '#000'
			download: false
			onComplete: (png, pixels) ->
				canvas = document.getElementById('waveform')
				canvas.width = canvasWidth
				canvas.height = canvasHeight
				context = canvas.getContext('2d')
				context.putImageData(pixels, 0, 0)
				
				img = new Image()
				img.src = canvas.toDataURL()
				
				context.translate(canvas.width / 2, canvas.height / 2)
				context.rotate(Math.PI)
				context.scale(-1, 1)
				context.translate(0, 0)
				context.drawImage(img, -canvas.width / 2, -canvas.height / 2 + 5, img.width, img.height / 3)
				context.restore()
				
				
				
				