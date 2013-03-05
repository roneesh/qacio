$(document).ready ->

  $("#main").on "click", ".redBox", (e) ->
    $(e.target).fadeOut()