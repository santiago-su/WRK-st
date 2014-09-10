$(document).ready(function() {
  $(document).bind('ajaxSend', '#new_location', function(event, jqxhr, request, settings){
    $('#new_location').bootstrapValidator({
        message: 'This value is not valid',
        excluded: [':disabled'],
        fields: {
            'location[name]': {
                message: 'No puede estar vacío',
                validators: {
                    notEmpty: {
                        message: 'No puede estar vacío'
                    },
                }
            },
            'location[description]': {
                message: 'No puede estar vacío',
                validators: {
                    notEmpty: {
                        message: 'No puede estar vacío'
                      }
                    }
                  },
              }
    });

$('form#new_location').on('success.form.bv', function(e) {
        // Called when the form is valid
        var $form = $(e.target);
        if ($form.data('remote') && $.rails !== undefined) {
            e.preventDefault();
        }
    });
$('#new_location_modal').on('shown.bs.modal', function() {
  $('#new_location').bootstrapValidator('resetForm', true);
});




(function($) {

  $.fn.modal_ok = function(){
    this.modal('hide');
    this.find('form input').val('');
  };

}(jQuery));

})
});
