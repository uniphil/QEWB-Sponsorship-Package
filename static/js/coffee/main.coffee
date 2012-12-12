$ ->
  $('.slider h2 a').click ->
  	$(this).parent().parent().toggleClass('show')
  	return false