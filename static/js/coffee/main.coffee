$ ->
  $('.slider h2 a').click ->
  	$('.slider li').removeClass 'show'
  	$(this).parents('li').addClass 'show'
  	false

  r = Raphael 'pie'
  pie = r.piechart 320, 240, 100,
  	[37, 32, 19, 7, 5],
  	legend: ['%% Junior Fellow','%% National Conference',
  	  '%% Youth Engagement and Global Engineering',
  	  '%% Fair Trade Advocacy', '%% Recruitment/ Administrative'],
  	legendpos: 'east',
  	href: ['#overseas-programs', '#national-conference',
  	  '#what-we-do', '#fair-trade']
  pie.hover ->
  	this.sector.stop()
  	this.sector.scale 1.1, 1.1, this.cx, this.cy
