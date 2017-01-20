class Iniciados.Routers.Audios extends Backbone.Router
	routes:
		'audios/adm/new' : 'new'
	new: ->
		view = new Iniciados.Views.AudiosNew()