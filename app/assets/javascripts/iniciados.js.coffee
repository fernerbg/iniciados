window.Iniciados =
	Models: {}
	Collections: {}
	Views: {}
	Routers: {}
	initialize: ->
		@.checkCredentials()
		      
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
		
	checkCredentials: ->
		if typeof localStorage.aws_credentials is 'undefined'
			$.get('users/get_cognito_token.json', (data) ->
				params =
					IdentityPoolId: data.identity_pool_id
					IdentityId: data.aws_credentials.identity_id
					Logins:
					  'cognito-identity.amazonaws.com': data.aws_credentials.token
					  
				AWS.config.region = 'us-west-2'
				AWS.config.credentials = new AWS.CognitoIdentityCredentials params
					
				localStorage.aws_credentials = JSON.stringify params
			)
		else
			AWS.config.region = 'us-west-2'
			AWS.config.credentials = new AWS.CognitoIdentityCredentials JSON.parse localStorage.aws_credentials
		
		###
		s3 = new AWS.S3
			apiVersion: '2006-03-01',
			params:
				Bucket: 'iniciados-dev'
		
		s3.listObjects { Delimiter: '/' }, (err, data) ->
			if err
				return alert('There was an error listing your albums: ' + err.message)
			else
				albums = data.CommonPrefixes.map((commonPrefix) ->
					prefix = commonPrefix.Prefix
					albumName = decodeURIComponent(prefix.replace('/', ''))
					console.log albumName
					return
				)
			return
		###
		
$(document).ready ->
	Iniciados.initialize()

$(document).on('page:load', Iniciados.initialize)

$(document).on "turbolinks:load", ->
	Iniciados.initialize()