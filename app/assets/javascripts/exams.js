$( document ).ready(function() {
  $('form').on('click', '.remove_fields', function() {
    //console.log('Clickeé remove_fields');
    // this acá es el nodo con clase remove_fields
    $(this).prev('input[type=hidden]').val('1');
    $(this).closest('fieldset').hide();
  });

  $('form').on('click', '.add_fields', function(e) {
    time = new Date().getTime();
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
    e.preventDefault()
  });
});