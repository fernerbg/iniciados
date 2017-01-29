class Iniciados.Routers.Books extends Backbone.Router
	routes:
		'books/:id/show_page' : 'show_page'
		'adm/books/:id/new_page' : 'new_page'
	show_page: ->
		view = new Iniciados.Views.BooksShowPage()
	new_page: ->
	 	view = new Iniciados.Views.BooksNewPage()