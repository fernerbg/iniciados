window.Iniciados =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
  	new Iniciados.Routers.Contents()
  	new Iniciados.Routers.LessonLevels()
  	Backbone.history.stop()
  	Backbone.history.start( pushState: true )

$(document).ready ->
  Iniciados.initialize()

$(document).on('page:load', Iniciados.initialize)
