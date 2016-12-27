class Iniciados.Views.LevelPagesNew extends Backbone.View

	el: 'body'
	
	initialize: ->
		webIniciados.checkCredentials()
		
		$('#image').awsUploader(location)