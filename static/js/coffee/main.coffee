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
  bright = (what) ->
    what.stop()
    what.animate opacity: 1, 50, 'ease'
  dim = (what) ->
    what.stop()
    what.animate opacity: 0.5, 100, 'ease'
  hide = (what) ->
    what.stop()
    what.animate opacity: 0, 50, 'ease'

  # get data
  data =
    total: 0
  data.programs =
    $('#chart-fallback li').map ->
      cost = +$(this).find('.program-cost').text()
      data.total += cost
      name: $(this).find('.program-name').text(),
      cost: cost,
      slug: $(this).attr('id'),
      part: ->
        this.cost / data.total

  # draw the chart
  raph = Raphael 'pie', '100%', '100%'
  raph.setViewBox 0, 0, 360, 360, true
  bulb = raph.image('/static/img/bulb.svg', 180 - (106/2), 180 - (188/2), 106, 188)
  bulb.attr opacity: 0.1

  raph.ca.arc = (x, y, r, start, size, thickness, colour, swidth, stroke) ->
    r_outer = r - swidth/2
    r_inner = r - thickness + swidth/2
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

  show_info = ->
    bright this
    circle_info.show this.budget_data

  hide_info = ->
    dim this
    circle_info.hide()

  for program in data.programs
    arc_colour = Raphael.hsb(colour/(data.programs.length+1), 0.5, 0.9)

    an_arc = raph.path().attr
      arc: [180, 180, 180, start, program.part() * 360, 72, arc_colour, 2, '#000']
      opacity: 0.5
    an_arc.budget_data = program

    an_arc.hover(show_info, hide_info).touchstart(show_info)

    start += program.part() * 360
    colour += 1

  circle_info = {
    title: raph.text(180, 160, 'Total Budget').attr
      'font-family': 'Anaheim'
      'font-size': 20
      'font-weight': 'bold'
      fill: '#fff'
      opacity: 1

    hint: raph.text(180, 190, 'hover chart to see details').attr
      'font-size': 14
      fill: '#fff'
      opacity: 0.9

    cost: raph.text(180, 210, "$ ".concat(data.total)).attr
      'font-family': 'Anaheim'
      'font-size': 20
      fill: '#fff'
      opacity: 0.9

    percent: raph.text(180, 230, '').attr
      'font-size': 14
      fill: '#fff'
      opacity: 0

    show: (data) ->
      this.title.attr text: data.name.split('& ').join("&\n").split('/ ').join("/\n")
      this.hint.stop()
      this.hint.animate opacity: 0, 200, 'ease'
      this.cost.attr text: "$ ".concat(data.cost)
      this.percent.attr
        text: ''.concat(Math.round(data.part() * 100, 2), '%')
        opacity: 0.9

    hide: ->
      this.title.attr text: 'Total Budget'
      this.hint.stop()
      this.hint.animate opacity: 0.667, 600, 'ease'
      this.cost.attr text: "$ ".concat(data.total)
      this.percent.attr opacity: 0
  }

  # scale the pie to its container
  size = $('#pie-container').width()
  $('#pie').css height: size, width: size

