window.Iniciados =
	Models: {}
	Collections: {}
	Views: {}
	Routers: {}
	initialize: ->
		self = @
		webIniciados.updateCredentials()
		setInterval (->
			webIniciados.updateCredentials()
		), 60000 * 5
		
		$('#button-downward').click( ->
			$("html, body").animate({ scrollTop: window.innerHeight }, 700)
		)
		
		controller = $('body').data('controller')
		new Iniciados.Routers.Contents() if controller == 'contents'
		new Iniciados.Routers.LessonLevels() if controller == 'lesson_levels'
		new Iniciados.Routers.Users() if controller == 'users'
		new Iniciados.Routers.Levels() if controller == 'levels'
		new Iniciados.Routers.LevelPages() if controller == 'level_pages'
		
		Backbone.history.stop() 
		Backbone.history.start( pushState: true )
		
	
$(document).ready ->
	Iniciados.initialize()

$(document).on('page:load', Iniciados.initialize)

$(document).on "turbolinks:load", ->
	Iniciados.initialize()