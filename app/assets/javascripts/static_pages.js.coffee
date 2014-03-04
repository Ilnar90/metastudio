# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  $('.microposts li').on 'click', 'a', (event)->
    event.preventDefault()
    $.ajax
      type: "POST"
      dataType: 'json'
      url: $(@).attr('href')
      data: { type: 'up' }
      success: (data)->
        $('.votes-count').html(data.count + ' like')

    return false
