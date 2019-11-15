# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
	$('.datahora').datetimepicker
		format: 'd/m/Y H:i O'
		step: 30
		inline: true
		defaultDate: new Date()
		defaultTime: new Date().getHours() + ":" + new Date().getMinutes(), formatTime:'H:i'
		validateOnBlur: false
  # Documentação do datetimepicker: https://xdsoft.net/jqplugins/datetimepicker/