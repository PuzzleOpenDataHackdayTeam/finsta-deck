#= require jquery
#= require jquery.mobile.min
#= require jquery.mobile.subpage

window.runSvg = ->
  ids = [
    "jura"
    "emmental"
    "thun"
    "oberaargau"
    "seeland"
    "mittelland"
    "biel"
    "saanen"
    "frutigen"
    "oberaargau"
    "interlaken"
  ]

  colors = [
    "red"
    "blue"
    "green"
  ]
  rand = (max) ->
    parseInt((Math.random() * max))

  fill = ->
    $('svg > g').attr('style', '')
    $("##{ids[rand(ids.length)]}").attr('style', "fill: #{colors[rand(colors.length)]}")

  setInterval(fill, 1000)


$(document).ajaxError (ev, xhr, settings) ->
  window.location.href = settings.url

$(document).on 'pagecreate', ->
  if window.location.pathname is '/svg'
    runSvg()



