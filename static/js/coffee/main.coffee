$ ->
  $('.slider h2 a').click ->
    $('.slider li').removeClass 'show'
    $(this).parents('li').addClass 'show'
    false

  r = Raphael 'pie'
  pie = r.piechart 320, 240, 100,
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
