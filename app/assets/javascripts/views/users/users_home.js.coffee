class Iniciados.Views.UsersHome extends Backbone.View

	el: 'body'
	
	newWidth: 0
	
	loading: false
	
	pages: ["http://shaktianandama.com"]
		
	events:
		"resize window" : "onResize"
		
	month: ""
	
	initialize: ->
		self = this
		@.newWidth = parseInt($('.new-wrapper:first').css('width'))
		@.setInfoProperties()
		@.setImageProperties()
		@.month = $('.month-title:last').html()
		@.getMonthPosts()
		$('.news-container .container:last').addClass('current-container')
		$('.footer-image').load ->
			footerHeight = $(this).height()
			$(window).scroll ->
				if $(window).scrollTop() + $(window).height() > $(document).height() - footerHeight - 600 and self.loading is false
					self.loading = true
					date = $('.information-wrapper:last').data('date')
					$.getJSON gon.notifications_path, {date: date}, (data) ->
						console.log(data)
						if data isnt null
							for i of data.months
								if data.months.hasOwnProperty i
									month = data.months[i]
									if self.month isnt month.date
										self.month = month.date
										monthText = month.date.split(" ")[0].toLowerCase()
										monthWrapper = $('<div>', {class: "month " + monthText + " " + monthText + "-bcg"})
										dateWrapper = $('<div>', {class: "date-wrapper"})
										dateWrapper.append($('<div>', {class: "month-title verlag-bold"}).html(month.date))
										monthWrapper.append(dateWrapper)
										$('.current-container:first').removeClass('current-container')
										monthWrapper.append($('<div>', {class: "container current-container"}))
										$(".news-container:first").append(monthWrapper)
									for notification in month.notifications
										if  (i + 1) % 2 == 0
											(new self.leftContentNotification({model: notification})).render()
										else
											(new self.rightContentNotification({model: notification})).render()
				
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
			$('.new-wrapper.not-formatted .content-wrapper img').one("load", ->
				image = $(this)
				image.css({'width': 'auto', 'position': 'relative'})
				imageHeight = parseInt(image.css('height'))
				imageWidth = parseInt(image.css('width'))
				contentHeight = parseInt($('.new-wrapper.not-formatted:first .content-wrapper').css('height'))
				contentWidth = parseInt($('.new-wrapper.not-formatted:first .content-wrapper').css('width'))
				if imageWidth > contentWidth
					if imageWidth > imageHeight
						image.css({'width': '100%', 'position': 'static'})
						if parseInt(image.css('height')) < contentHeight
							image.css({'width': 'auto', 'position': 'relative'})
							moveX = ((imageWidth - contentWidth) / 2) * -1
							image.css('left', moveX + 'px')
					else
						moveX = ((imageWidth - contentWidth) / 2) * -1
						image.css('left', moveX + 'px')
				if imageHeight > contentHeight
					moveY = ((imageHeight - contentHeight) / 2) * -1
					image.css('top', moveY + 'px')
				image.closest('.new-wrapper').css('visibility', 'visible').removeClass('not-formatted')
			).each ->
				$(this).load() if this.complete
			
	onResize: ->
		infoHeight = $('.new-wrapper:first .information-wrapper').css('width')
		if infoHeight is not @.infoHeight
			@.infoHeight = infoHeight
			@.setInfoProperties
		
		newWidth = parseInt($('.new-wrapper:first').css('width'))
		if newWidth is not @.newWidth
			@.newWidth = newWidth
			@.setImageProperties
	
	getMonthPosts: (callback) ->
		self = this
		yearMonth = $('.month-title:last').data('yearmonth')
		console.log(yearMonth)
		postsLink = @.pages[0] + '/wp-json/wp/v2/posts?filter[m]=' + yearMonth + '&context=embed'
		console.log(postsLink)
		jQuery.get(postsLink, (data) ->
			total_posts = data.length
			for i of data
				post = data[i]
				if typeof post != 'function'
					date = new Date(post.date)
					month = date.toLocaleDateString("es", {month: "long"})
					month = month.charAt(0).toUpperCase() + month.slice(1)
					formatDate = date.toLocaleDateString("es", {day: "numeric"}) + " " + month + " " + date.getFullYear()
					notification = { id: post.id, date: post.date, title: post.title.rendered, formatDate: formatDate, description: post.excerpt.rendered }
					do (notification, post, i) ->
						jQuery.get(post._links["wp:featuredmedia"][0].href, (imageData) ->
							notification.link = imageData["guid"]["rendered"]
							total_posts--
							if  (parseInt(total_posts) + 1) % 2 == 0
								(new self.leftContentNotification({model: notification})).render()
							else
								(new self.rightContentNotification({model: notification})).render()
							if total_posts == 0
								#THE ORDER OF THESE TWO IS IMPORTANT
								self.setInfoProperties()
								self.setImageProperties()
						)
		)
		
	leftContentNotification: Backbone.View.extend
		render: ->
			template = _.template($('#left-content-notification').html())
			$('.current-container:first').append(template(this.model))
	
	rightContentNotification: Backbone.View.extend
		render: ->
			template = _.template($('#right-content-notification').html())
			$('.current-container:first').append(template(this.model))
			