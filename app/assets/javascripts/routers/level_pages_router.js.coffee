class Iniciados.Routers.LevelPages extends Backbone.Router
	routes:
		'level_pages/new' : 'new'
		
	new: ->
		view = new Iniciados.Views.LevelPagesNew()