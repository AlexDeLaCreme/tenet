# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $('body').keydown( (e) ->
    # console.log(e)
    # console.log(e.keyCode)

    switch e.keyCode
      when 39, 32, 13, 78 then console.log 'next' # n, ->, Enter, Space
      when 65 then console.log 'add new' # a
      when 68 then console.log 'destroy' # d
      when 69 then console.log 'edit' # e
      when 82 then console.log 'archive' # r
      when 67 then console.log 'categories' if e.ctrlKey is true # Ctrl + c
      when 73 then console.log 'index' if e.ctrlKey is true # Ctrl + i
  )