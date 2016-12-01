class Iniciados.Routers.LevelPages extends Backbone.Router
	routes:
		'level_pages/new' : 'new'
		'level_pages/:id' : 'show'
		
	new: ->
		view = new Iniciados.Views.LevelPagesNew()
		
	show: ->
		view = new Iniciados.Views.LevelPagesShow()