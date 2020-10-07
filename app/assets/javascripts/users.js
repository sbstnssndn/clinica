// $(document).ready(function() {
//   if ($('#profile').val() !== null) {
//     $('#profile_fields')
//   }
// });

$(document).on('change', '#profile', function() {
  $.ajax({
    url: '/admin/users/profile_partial',
    data: { profile_type: $('#profile').val() },
    beforeSend: function() {
      $('#loader').html('<p>Cargando...</p>');
    },
    success: function() {
      $('#loader').html('');
    }
  });
  console.log('profile cambió y se envío el request ajax.');
});