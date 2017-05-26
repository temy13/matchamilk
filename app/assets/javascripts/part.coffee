# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('.member-select-control').on
       'change': -> $('#member-select-form').submit()
  $('.dayinfo').on
       'click': ->
          $('#' + $(this).attr('id') + '-detail').slideToggle();
