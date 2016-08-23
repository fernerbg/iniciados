window.Iniciados =
	Models: {}
	Collections: {}
	Views: {}
	Routers: {}
	initialize: ->
		$('#button-downward').click( ->
			$("html, body").animate({ scrollTop: window.innerHeight }, 700)
		)
		controller = $('body').data('controller')
		console.log controller
		new Iniciados.Routers.Contents() if controller == 'contents'
		new Iniciados.Routers.LessonLevels() if controller == 'lesson_levels'
		new Iniciados.Routers.Users() if controller == 'users'
		new Iniciados.Routers.Levels() if controller == 'levels'
		Backbone.history.stop() 
		Backbone.history.start( pushState: true )
		
$(document).ready ->
	Iniciados.initialize()

$(document).on('page:load', Iniciados.initialize)