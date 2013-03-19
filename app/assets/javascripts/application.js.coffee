#= require jquery
#= require jquery.mobile.min
#= require jquery.mobile.subpage

$(document).ajaxError (ev, xhr, settings) ->
  window.location.href = settings.url
