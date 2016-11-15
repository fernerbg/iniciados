class Iniciados.Views.PagesNew extends Backbone.View

	el: 'body'
	
	totalPages: 0
	
	uploadedPages: 0
	
	initialize: ->
		alert 'here'
		self = @
		
		$('#new_page').click ->
			self.totalPages = 0
			self.uploadedPages = 0
			$('.total-pages').html('0')
			$('.uploaded-pages').html('0')
			$('.failed-uploades').html('')
			
		$('#content_document').fileupload
			dataType: "json"
			add: (e, data) ->
				self.totalPages = self.totalPages + 1
				$('.total-pages').html(self.totalPages)
				fileName = data.files[0].name
				pageName = fileName.substr(fileName.length - 7)
				pageNumber = parseInt pageName
				if isNaN pageNumber
					pageName = fileName.substr(fileName.length - 6)
					pageNumber = parseInt pageName
					if isNaN pageNumber
						pageName = fileName.substr(fileName.length - 5)
						pageNumber = parseInt pageName
				
				if not isNaN pageNumber
					$('#book_page_number').val(pageNumber)
					data.submit()
			success: (data) ->
				if data.id == null
					$('.failed-uploades').append('<li>' + data.document.url + '</li>')
				else
					self.uploadedPages = self.uploadedPages + 1
					$('.uploaded-pages').html(self.uploadedPages)