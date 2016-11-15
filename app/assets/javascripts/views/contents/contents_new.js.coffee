class Iniciados.Views.ContentsNewContent extends Backbone.View

	el: 'body'

	initialize: ->
		self = @
		fileInput = $('.directUpload').find('input:file').first()
		form         = fileInput.closest('form')
		console.log fileInput.html()
		progressBar  = $("<div class='bar'></div>")
		barContainer = $("<div class='progress'></div>").append(progressBar)
		fileInput.after(barContainer)
		fileInput.fileupload
			replaceFileInput: false
			progressall: (e, data) ->
				progress = parseInt(data.loaded / data.total * 100, 10)
				progressBar.css('width', progress + '%')
			done: (e, data) ->
				key   = $(data.jqXHR.responseXML).find("Key").text()
				$("#key").val(key)
					
		