class Iniciados.Views.LessonsNewPdf extends Backbone.View

	el: 'body'
		
	initialize: ->
		webIniciados.checkCredentials()
		
		$('#image').awsUploader()