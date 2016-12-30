class Iniciados.Routers.Audios extends Backbone.Router
	routes:
		'audios/new' : 'new'
	new: ->
		view = new Iniciados.Views.AudiosNew()