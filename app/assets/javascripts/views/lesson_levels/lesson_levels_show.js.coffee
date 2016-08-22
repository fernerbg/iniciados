class Iniciados.Views.LessonLevelsShow extends Backbone.View

	el: 'body'

	lessonListAbsoluteTop: 0

	currentLesson: null

	lessonContainerTop: 0

	events:
		'click .lesson_list div': 'scrollToLesson'
		'scroll window': 'fixLessonList'
		'click .prev-item': 'scrollPrevLesson'
		'click .next-item': 'scrollNextLesson'
	initialize: ->
		self = this
		@lessonListAbsoluteTop = $('.lesson_list').css('top')
		@lessonContainerTop = $('.contenido-wrapper:first').position().top
		@currentLesson = $('.lesson_view_wrapper:first')
		$(window).on('scroll', ->
			self.fixLessonList()
		)
		@fixLessonList()
		
	scrollToLesson: (event) ->
		lesson_id = $(event.target).data('id')
		top =  + @lessonContainerTop + $(".lesson_view_wrapper[data-id='" +lesson_id+ "']:first").position().top
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
		top = $('.contenido-wrapper:first').position().top + parseInt $('.contenido-wrapper:first').css('padding-top')
		windowTop = $(window).scrollTop()
		console.log(top)
		if windowTop >= top
			$('.lesson_list').css
				position: 'fixed'
				top: @lessonContainerTop - 45
		else
			$('.lesson_list').css
				position: 'absolute'
				top: @lessonListAbsoluteTop
		if windowTop >= @lessonContainerTop + @currentLesson.position().top + @currentLesson.height() + parseInt(@currentLesson.css('margin-top'))
			nextLesson = @currentLesson.next()
			if typeof nextLesson.position() != 'undefined'
				@currentLesson = nextLesson
				$('.lesson_list .actual').removeClass 'actual'
				$('.lesson_list div[data-id="' + @currentLesson.data('id') + '"]').addClass 'actual'
		else if windowTop < @lessonContainerTop + @currentLesson.position().top
			prevLesson = @currentLesson.prev()
			if typeof prevLesson.position() != 'undefined'
				@currentLesson = prevLesson
				$('.lesson_list .actual').removeClass 'actual'
				$('.lesson_list div[data-id="' + @currentLesson.data('id') + '"]').addClass 'actual'
