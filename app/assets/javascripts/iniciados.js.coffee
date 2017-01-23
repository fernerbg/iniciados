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
		
		$('.sky-header').headroom()
		
		$('#button-downward').click( ->
			$("html, body").animate({ scrollTop: window.innerHeight }, 700)
		)
		
		$('#carousel-images').css("height", window.innerHeight + "px")
		
		$( window ).resize ->
			$('#carousel-images').css("height", window.innerHeight + "px")
			
		controller = $('body').data('controller')
		new Iniciados.Routers.Contents() if controller == 'contents'
		new Iniciados.Routers.LessonLevels() if controller == 'lesson_levels'
		new Iniciados.Routers.Users() if controller == 'users'
		new Iniciados.Routers.Levels() if controller == 'levels'
		new Iniciados.Routers.Audios() if controller == 'audios'
		
		Backbone.history.stop()
		Backbone.history.start( pushState: true )
		
###
$(document).ready ->
	console.log 'ready'
	Iniciados.initialize()

$(document).on('page:load', ->
	console.log 'loaded'
	Iniciados.initialize
)
###

$(document).on "turbolinks:load", ->
	console.log 'turbolinked'
	Iniciados.initialize()