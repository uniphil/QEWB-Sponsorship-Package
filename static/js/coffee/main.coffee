$ ->

  # What we do slider
  $('.slider h2 a').click ->
    $('.slider li').removeClass 'show'
    $(this).parents('li').addClass 'show'
    false

  # Sticky Scrollbar for Tablets


  # Scrollbar position indicator
  spots = $('body').children('header, section')
  spot_links = $('nav a')
  spot_links.scrollTo()
  current_spot = $(spot_links[0])
  body_width = 

  set_spot = (spot) ->
    if spot != current_spot
      spot_links.removeClass 'current'
      spot.addClass 'current'
      current_spot = spot

  $(document).scroll (e) ->
    view3 = $(window).innerHeight() / 3
    current_line = $(document).scrollTop()
    if 480 < $('body').width() < 768
      stick_height = $('hgroup').height()
      if current_line > stick_height
        $('nav').addClass 'stick-top'
      else
        $('nav').removeClass 'stick-top'
    for spot in spots
      if (spot.offsetTop + $(spot).height() - view3) > current_line
        nav_link = $('nav a[href=#' + spot.id + ']')
        set_spot $(nav_link)
        break


  # Budget Pie Chart
  r = Raphael 'pie', '100%', '100%'
  r.setViewBox 0, 0, 640, 360, true
  pie = r.piechart 180, 180, 160,
    [37, 32, 19, 7, 5],
    legend: ['%% Junior Fellow','%% National Conference', '%% Youth Engagement and Global Engineering', '%% Fair Trade Advocacy', '%% Recruitment/ Administrative']
    href: ['#overseas-programs', '#national-conference', '#what-we-do', '#fair-trade']
    legendpos: 'east'
    legendcolor: '#fff'
    strokewidth: 2

  pie.hover(
    ->
      this.sector.stop()
      this.sector.scale 1.1, 1.1, this.cx, this.cy
      if this.label
        this.label[0].stop()
        this.label[0].attr r: 7.5
        this.label[1].attr 'font-weight': 800
    ->
      this.sector.animate transform: 's1 1 ' + this.cx + ' ' + this.cy, 100, 'ease'
      if this.label
        this.label[0].animate r: 5, 100, 'ease'
        this.label[1].attr 'font-weight': 400
  )
