class Iniciados.Routers.Audios extends Backbone.Router
	routes:
		'adm/audios/new' : 'new'
	new: ->
		view = new Iniciados.Views.AudiosNew()