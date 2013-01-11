$ ->

  # What we do slider
  $('.slider h2 a').click ->
    $('.slider li').removeClass 'show'
    $(this).parents('li').addClass 'show'
    false
    

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
  bright = ->
    this.stop()
    this.animate opacity: 1, 50, 'ease'
  dim = ->
    this.stop()
    this.animate opacity: 0.5, 100, 'ease'

  # get data
  data =
    total: 0
  data.programs =
    $('#chart-fallback li').map ->
      cost = +$(this).find('.program-cost').text()
      data.total += cost
      name: $(this).find('.program-name').text(),
      slug: $(this).attr('id'),
      cost: cost

  # draw the chart
  raph = Raphael 'pie', '100%', '100%'
  raph.setViewBox 0, 0, 360, 360, true
  bulb = raph.image('/static/img/bulb.svg', 180 - (106/2), 180 - (188/2), 106, 188)
  bulb.attr opacity: 0.5
  bulb.hover bright, dim

  raph.ca.arc = (x, y, r, start, size, thickness, colour, swidth, stroke) ->
    R = r - swidth/2
    r_outer = R
    r_inner = r - thickness
    rad_start = (start + 32) * Math.PI / 180
    rad_end = (start + 32 + size) * Math.PI / 180
    x1 = x - r_outer * Math.cos(rad_start)
    y1 = y - r_outer * Math.sin(rad_start)
    x2 = x - r_outer * Math.cos(rad_end)
    y2 = y - r_outer * Math.sin(rad_end)
    x3 = x - r_inner * Math.cos(rad_end)
    y3 = y - r_inner * Math.sin(rad_end)
    x4 = x - r_inner * Math.cos(rad_start)
    y4 = y - r_inner * Math.sin(rad_start)
    fill: colour,
    'stroke-width': swidth,
    stroke: stroke,
    path: [
      ["M", x1, y1],
      ["A", r_outer, r_outer, 0, +(size > 180), 1, x2, y2],
      ["L", x3, y3],
      ["A", r_inner, r_inner, 0, +(size > 180), 0, x4, y4],
      ["Z"]
    ]

  # draw the arcs
  start = 0
  colour = 0
  for program in data.programs
    degs = program.cost / data.total * 360
    arc_colour = Raphael.hsb(colour/(data.programs.length+1), 0.5, 0.9)

    an_arc = raph.path().attr
      arc: [180, 180, 180, start, degs, 72, arc_colour, 2, '#000']
      opacity: 0.5
    an_arc.budget_data = program

    an_arc.hover(bright, dim).touchstart(bright).touchend(dim)

    start += degs
    colour += 1

  # scale the pie to its container
  size = $('#pie-container').width()
  $('#pie').css height: size, width: size

