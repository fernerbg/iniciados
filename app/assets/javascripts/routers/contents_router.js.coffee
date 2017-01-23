class Iniciados.Routers.Contents extends Backbone.Router
	routes:
		'contents/show_page' : 'show_page'
		'adm/contents/new_page' : 'new_page'
	show_page: ->
		view = new Iniciados.Views.ContentsShowPage()
	new_page: ->
	 	view = new Iniciados.Views.ContentsNewPage()