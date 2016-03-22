// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var _lessonListAbsoluteTop = 0;
var _currentLesson = null;
var _lessonContainerTop = 0;

function ready_lesson_levels(){
	_lessonListAbsoluteTop = $('.lesson_list').css('top');
	_lessonContainerTop = $('.contenido-wrapper:first').position().top;
	_currentLesson = $('.lesson_view_wrapper:first');
	lessonListClick();
	lessonListToFixed();
}
$(document).ready(ready_lesson_levels)
$(document).on('page:load', ready_lesson_levels)

function lessonListClick(){
	$('.lesson_list div').click(function(){
		var lesson_id = $(this).data('id');
		var top =  + _lessonContainerTop + $(".lesson_view_wrapper[data-id='" +lesson_id+ "']:first").position().top;
		$("html, body").animate({ scrollTop: top }, 1000);
	})
}

function lessonListToFixed(){
	$(window).scroll(function(){
		var top = $('.contenido-wrapper:first').position().top;
		var windowTop = $(this).scrollTop()
		if(windowTop >= top) {
			$('.lesson_list').css({position: 'fixed', top: _lessonContainerTop - 45});
		}
		else {
			$('.lesson_list').css({position: 'absolute', top: _lessonListAbsoluteTop});
		}

		if(windowTop >= _lessonContainerTop + _currentLesson.position().top + _currentLesson.height() + parseInt(_currentLesson.css('margin-top'))){
			var nextLesson = _currentLesson.next();
			if(typeof nextLesson.position() !== 'undefined'){
				_currentLesson = nextLesson;
				$('.lesson_list .actual').removeClass('actual');
				$('.lesson_list div[data-id="' +_currentLesson.data('id')+ '"]').addClass('actual');
			}
		}
		else if(windowTop < _lessonContainerTop + _currentLesson.position().top){
			var prevLesson = _currentLesson.prev();
			if(typeof prevLesson.position() !== 'undefined'){
				_currentLesson = prevLesson;
				$('.lesson_list .actual').removeClass('actual');
				$('.lesson_list div[data-id="' +_currentLesson.data('id')+ '"]').addClass('actual');	
			}
		}
	})
}