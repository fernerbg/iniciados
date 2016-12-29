class Iniciados.Views.ContentsNewPage extends Backbone.View

	el: 'body'
	
	initialize: ->
		webIniciados.checkCredentials()
		
		$('#image').awsUploader(location)