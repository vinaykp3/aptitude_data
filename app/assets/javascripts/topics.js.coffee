# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
window.topics_result_list = (path) ->
  topic_name = $('#search').val()
  $('#result_list_for_topics').load(path+"?topic_name="+topic_name)