class Iniciados.Views.BooksNewPage extends Backbone.View

	el: 'body'
	
	initialize: ->
		$('#image').awsUploader(location)