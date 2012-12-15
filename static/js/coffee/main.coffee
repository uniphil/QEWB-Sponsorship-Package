$ ->
  $('.slider h2 a').click ->
  	$('.slider li').removeClass 'showy'
  	$(this).parents('li').addClass 'shows'
  	false