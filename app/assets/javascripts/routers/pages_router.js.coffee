class Iniciados.Routers.Pages extends Backbone.Router
	routes:
		'adm/books/:book_id/pages/new' : 'new'
		
	new: ->
		view = new Iniciados.Views.PagesNew()