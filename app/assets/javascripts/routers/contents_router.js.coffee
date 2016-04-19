class Iniciados.Routers.Contents extends Backbone.Router
	routes:
		'contents/show_book' : 'show_book'

	show_book: ->
		view = new Iniciados.Views.ContentsShowBook()