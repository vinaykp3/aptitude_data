# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
window.create_topic_questions_form = (path) ->
  topic_id = $('#topic_id').val()
  console.log(topic_id)
  $('#create_form').load(path+"?topic_id="+topic_id)



