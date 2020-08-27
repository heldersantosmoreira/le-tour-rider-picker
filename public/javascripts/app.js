$(function() {
  $("#rider_name").autocomplete({
    source: function(request, response) {
      $.ajax({
        url: '/rider',
        dataType: 'json',
        data: {
          search: request.term
        },
        success: function( data ) {
          var results = $.map(data, function(rider, index) {
            return { id: rider.id, label: rider.name, value: rider.name };
          });

          response(results);
        }
      });
    }
  });
});
