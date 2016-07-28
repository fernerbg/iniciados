window.Iniciados =
	Models: {}
	Collections: {}
	Views: {}
	Routers: {}
	initialize: ->
		new Iniciados.Routers.Contents()
		new Iniciados.Routers.LessonLevels()
		new Iniciados.Routers.Users()
		Backbone.history.stop() 
		Backbone.history.start( pushState: true )

$(document).ready ->
	Iniciados.initialize()
	$('#carousel-example-generic').carousel()

$(document).on('page:load', Iniciados.initialize)
