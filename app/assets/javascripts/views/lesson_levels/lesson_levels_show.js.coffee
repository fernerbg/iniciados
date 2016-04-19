class Iniciados.Views.LessonLevelsIndex extends Backbone.View

  el: 'body'

  lessonListAbsoluteTop: 0

  currentLesson: null

  lessonContainerTop: 0

  events:
  	'click .lesson_list div': 'scrollToLesson'
  	'scroll window': 'fixLessonList'
  initilize: ->
		@lessonListAbsoluteTop = $('.lesson_list').css('top');
		@lessonContainerTop = $('.contenido-wrapper:first').position().top;
		@currentLesson = $('.lesson_view_wrapper:first');
		@lessonListToFixed();

	scrollToLesson: (event) ->
		lesson_id = $(event.target).data('id');
		top =  + @lessonContainerTop + $(".lesson_view_wrapper[data-id='" +lesson_id+ "']:first").position().top;
		$("html, body").animate({ scrollTop: top }, 1000);
	
	fixLessonList: (event) ->
		top = $('.contenido-wrapper:first').position().top
		windowTop = $(event.target).scrollTop()
		if windowTop >= top
		  $('.lesson_list').css
		    position: 'fixed'
		    top: _lessonContainerTop - 45
		else
		  $('.lesson_list').css
		    position: 'absolute'
		    top: _lessonListAbsoluteTop
		if windowTop >= _lessonContainerTop + _currentLesson.position().top + _currentLesson.height() + parseInt(_currentLesson.css('margin-top'))
		  nextLesson = _currentLesson.next()
		  if typeof nextLesson.position() != 'undefined'
		    _currentLesson = nextLesson
		    $('.lesson_list .actual').removeClass 'actual'
		    $('.lesson_list div[data-id="' + _currentLesson.data('id') + '"]').addClass 'actual'
		else if windowTop < _lessonContainerTop + _currentLesson.position().top
		  prevLesson = _currentLesson.prev()
		  if typeof prevLesson.position() != 'undefined'
		    _currentLesson = prevLesson
		    $('.lesson_list .actual').removeClass 'actual'
		    $('.lesson_list div[data-id="' + _currentLesson.data('id') + '"]').addClass 'actual'
