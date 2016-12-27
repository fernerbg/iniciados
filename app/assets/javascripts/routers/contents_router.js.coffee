class Iniciados.Routers.Contents extends Backbone.Router
	routes:
		'contents/show_page' : 'show_page'
		
	show_page: ->
		view = new Iniciados.Views.ContentsShowPage()