class Iniciados.Routers.Contents extends Backbone.Router
	routes:
		'contents/show_book' : 'show_book'
		'contents/new' : 'new'
	show_book: ->
		view = new Iniciados.Views.ContentsShowBook()
	new: ->
		view = new Iniciados.Views.ContentsNewBook()