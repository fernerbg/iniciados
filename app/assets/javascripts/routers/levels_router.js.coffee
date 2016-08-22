class Iniciados.Routers.Levels extends Backbone.Router
	routes:
		'levels/:id' : 'show'
		
	show: ->
		view = new Iniciados.Views.LevelsShow()