class Iniciados.Routers.LessonLevels extends Backbone.Router
	routers:
		'lesson_levels/:id': 'show'

	show: ->
		new Iniciados.Views.LessonLevelsShow()
