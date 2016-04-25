class Iniciados.Routers.LessonLevels extends Backbone.Router
	routes:
		'lesson_levels/:id': 'show'

	show: ->
		new Iniciados.Views.LessonLevelsShow()
		alert('sdf')
