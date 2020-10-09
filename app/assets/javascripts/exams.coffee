# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'click', 'form .remove_fields', (event) ->
  $(this).prev('input[type=hidden]').val('1')
  console.log('cambié el valor a ' + $(this).prev('input[type=hidden]').val());
  $(this).closest('fieldset').hide()
  event.preventDefault()

$(document).on 'click', 'form .remove_fields2', (event) ->
  $(this).prev('input[type=hidden]').val('1')
  console.log('cambié el valor2 a ');
  console.log($(this));
  console.log($(this).prev('input[type=hidden]'));
  $(this).closest('fieldset').hide()
  event.preventDefault()

$(document).on 'click', 'form .add_fields', (event) ->
  time = new Date().getTime()
  regexp = new RegExp($(this).data('id'), 'g')
  $(this).before($(this).data('fields').replace(regexp, time))
  event.preventDefault()