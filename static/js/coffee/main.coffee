$ ->
  $('.slider h2 a').click ->
  	$(this).parents('li').toggleClass 'show'
  	false