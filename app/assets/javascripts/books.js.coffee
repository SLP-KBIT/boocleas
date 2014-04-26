# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  # enable chosen js
  console.log "hoge"
  $('.chosen-select').chosen
    allow_single_deselect: true
    no_result_text: '一致する候補がありません。'
    width: '200px'
