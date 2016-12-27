class Iniciados.Views.LessonsNewPdf extends Backbone.View

	el: 'body'
		
	initialize: ->
		webIniciados.checkCredentials()
		
		location = "lessons/" + $('#lesson_id').val() + "/reading/"
		
		$('#image').awsUploader(location)