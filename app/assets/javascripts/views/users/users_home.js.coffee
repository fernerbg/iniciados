class Iniciados.Views.UsersHome extends Backbone.View

	el: 'body'
	
	newWidth: 0
	
	loading: false
	
	events:
		"resize window" : "onResize"
		
	month: ""
	
	initialize: ->
		self = this
		@.newWidth = parseInt($('.new-wrapper:first').css('width'))
		@.setInfoProperties()
		@.setImageProperties()
		@.month = $('.month-title:last').html()
		$('.news-container .container:last').addClass('current-container')
		$('.footer-image').load ->
			footerHeight = $(this).height()
			$(window).scroll ->
				if $(window).scrollTop() + $(window).height() > $(document).height() - footerHeight - 600 and self.loading is false
					self.loading = true
					date = $('.information-wrapper:last').data('date')
					$.getJSON gon.notifications_path, {date: date}, (data) ->
						console.log data
						if data isnt null
							self.loading = false
								
							for i of data.months
								if data.months.hasOwnProperty i
									month = data.months[i]
									console.log month.date
									if self.month isnt month.date
										self.month = month.date
										monthText = month.date.split(" ")[0].toLowerCase()
										monthWrapper = $('<div>', {class: "month " + monthText + " " + monthText + "-bcg"})
										monthWrapper.append($('<div>', {class: "month-title verlag-bold"}).html(month.date))
										$('.current-container:first').removeClass('current-container')
										monthWrapper.append($('<div>', {class: "container current-container"}))
										$(".news-container:first").append(monthWrapper)
									for notification in month.notifications
										console.log notification
										notification.send = gon.send_content_path + "?element=notification_media&id=" + notification.id
										if  (i + 1) % 2 == 0
											(new self.leftContentNotification({model: notification})).render()
										else
											(new self.rightContentNotification({model: notification})).render()
											
							#THE ORDER OF THESE TWO IS IMPORTANT
							self.setInfoProperties()
							self.setImageProperties()
				
	setInfoProperties: ->
		self = this
		if self.newWidth + 30 is window.innerWidth
			$('.new-wrapper.not-formatted .information-wrapper').css('height', 'auto')
			$('.new-wrapper.not-formatted .content-wrapper').css('height', 'auto')
		else
			self.infoHeight = $('.new-wrapper.not-formatted:first .information-wrapper').css('width')
			$('.new-wrapper.not-formatted').each ->
				$(this).find('.content-wrapper').css('height', self.infoHeight)
				informationWrapper = $(this).find('.information-wrapper')
				currentHeight = informationWrapper.css('height')
				informationWrapper.css('height', self.infoHeight)
				if parseInt(currentHeight) > parseInt(self.infoHeight)
					myScroll = new IScroll('#' + informationWrapper.attr('id'), {mouseWheel: true, scrollbars: true, scrollbars: 'custom'})
	
	setImageProperties: ->
		if @.newWidth + 30 is window.innerWidth
			$('.new-wrapper.not-formatted .content-wrapper img').css({'width': '100%', 'position': 'static'})
			$('.new-wrapper.not-formatted').css('visibility', 'visible')
		else
			$('.new-wrapper.not-formatted .content-wrapper img').load ->
				image = $(this)
				image.css({'width': 'auto', 'position': 'relative'})
				imageHeight = parseInt(image.css('height'))
				imageWidth = parseInt(image.css('width'))
				contentHeight = parseInt($('.new-wrapper.not-formatted:first .content-wrapper').css('height'))
				contentWidth = parseInt($('.new-wrapper.not-formatted:first .content-wrapper').css('width'))
				if imageHeight > contentHeight
					moveY = ((imageHeight - contentHeight) / 2) * -1
					image.css('top', moveY + 'px')
				if imageWidth > contentWidth
					moveX = ((imageWidth - contentWidth) / 2) * -1
					image.css('left', moveX + 'px')
				image.closest('.new-wrapper').css('visibility', 'visible').removeClass('not-formatted')
				
	onResize: ->
		infoHeight = $('.new-wrapper:first .information-wrapper').css('width')
		if infoHeight is not @.infoHeight
			@.infoHeight = infoHeight
			@.setInfoProperties
		
		newWidth = parseInt($('.new-wrapper:first').css('width'))
		if newWidth is not @.newWidth
			@.newWidth = newWidth
			@.setImageProperties
			
	leftContentNotification: Backbone.View.extend
		render: ->
			template = _.template($('#left-content-notification').html())
			$('.current-container:first').append(template(this.model))
	
	rightContentNotification: Backbone.View.extend
		render: ->
			template = _.template($('#right-content-notification').html())
			$('.current-container:first').append(template(this.model))
			