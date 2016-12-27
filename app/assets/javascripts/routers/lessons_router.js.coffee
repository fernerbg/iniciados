class Iniciados.Routers.Lessons extends Backbone.Router
	routes:
		'lessons/new_pdf': 'new_pdf'

	new_pdf: ->
		new Iniciados.Views.LessonsNewPdf()
