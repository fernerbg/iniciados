class Iniciados.Routers.Pages extends Backbone.Router
	routes:
		'pages/new' : 'new'
		
	new: ->
		view = new Iniciados.Views.PagesNew()