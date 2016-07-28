class Iniciados.Routers.Users extends Backbone.Router
	routes:
		'' : 'home'

	home: ->
		view = new Iniciados.Views.UsersHome()