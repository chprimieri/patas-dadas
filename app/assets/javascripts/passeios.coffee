# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
	$('.datahora').datetimepicker
	        format: 'd/m/Y H:i'
	        step: 30
	        mask: '00/00/0000 00:00'
  # Documentação do datetimepicker: https://xdsoft.net/jqplugins/datetimepicker/