class Iniciados.Views.LessonLevelsShow extends Backbone.View

	el: 'body'

	lessonListAbsoluteTop: 0

	currentLesson: null

	lessonContainerTop: 0

	events:
		'click .occupied': 'scrollToLesson'
		'click .lessons-options li' : 'scrollToLesson'
		'scroll window': 'fixLessonList'
		'click .prev-item': 'scrollPrevLesson'
		'click .next-item': 'scrollNextLesson'
		
	initialize: ->
		self = this
		@currentLesson = $('.lesson-container:first')
		$(window).on('scroll', ->
			self.fixLessonList()
		)
		@fixLessonList()
		$('.lesson-image-wrapper').height(window.innerHeight)
		$(window).resize( ->
			$('.lesson-image-wrapper').height(window.innerHeight)	
		)
	scrollToLesson: (event) ->
		target = $(event.target)
		target = $(event.target).closest('.occupied') if not target.hasClass('occupied') || target.hasClass('option')
		lesson_id = $(event.target).data('id')
		top = $(".lesson-container[data-id='" +lesson_id+ "']:first").position().top - (window.innerHeight / 4)
		$("html, body").animate({ scrollTop: top }, 1000)
	
	scrollPrevLesson: (event) ->
		lessonContainer = $(event.target).closest('.lesson-container')
		previousLesson = lessonContainer.prev().prev()
		if typeof previousLesson.position() is 'undefined'
			top = 0
		else
			top = @lessonContainerTop + previousLesson.position().top
		
		$("html, body").animate({ scrollTop: top }, 700)
	
	scrollNextLesson: (event) ->
		lessonContainer = $(event.target).closest('.lesson-container')
		nextLesson = lessonContainer.next().next()
		if typeof nextLesson.position() is 'undefined'
			top = document.body.scrollHeight
		else
			top = @lessonContainerTop + nextLesson.position().top
		$("html, body").animate({ scrollTop: top }, 700)
		
	fixLessonList: () ->
		marginTop = 180
		top = window.innerHeight + marginTop
		$('.lessons-list').css('top', top + "px")
		windowTop = $(window).scrollTop()
		if windowTop >= top - marginTop
			$('.lessons-list').css
				position: 'fixed'
				top: marginTop
		else
			$('.lessons-list').css
				position: 'absolute'
				top: top
		nextLesson = @currentLesson.next().next()
		prevLesson = @currentLesson.prev().prev()
		if typeof nextLesson.position() != 'undefined' && windowTop >= nextLesson.position().top - (window.innerHeight / 2)
			@currentLesson = nextLesson
			$('.lessons-list .actual').removeClass 'actual'
			$('.lessons-list div[data-id="' + @currentLesson.data('id') + '"]').addClass 'actual'
			$('.lessons-options .actual').removeClass 'actual'
			$('.lessons-options li[data-id="' + @currentLesson.data('id') + '"]').addClass 'actual'
		else if typeof prevLesson.position() != 'undefined' && windowTop <  @currentLesson.position().top - (window.innerHeight / 2)
			@currentLesson = prevLesson
			$('.lessons-list .actual').removeClass 'actual'
			$('.lessons-list div[data-id="' + @currentLesson.data('id') + '"]').addClass 'actual'
			$('.lessons-options .actual').removeClass 'actual'
			$('.lessons-options li[data-id="' + @currentLesson.data('id') + '"]').addClass 'actual'
