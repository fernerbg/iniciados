class Iniciados.Views.LevelPagesNew extends Backbone.View

	el: 'body'
	
	initialize: ->
		webIniciados.checkCredentials()
		
		location = "levels/" + $('#level_id').val() + "/book/"
		
		$('#image').awsUploader(location)