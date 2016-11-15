class Iniciados.Routers.Pages extends Backbone.Router
	routes:
		'levels/:new' : 'new'
		
	show: ->
		view = new Iniciados.Views.PagesNew()