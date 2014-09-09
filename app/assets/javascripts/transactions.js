$(document).ready(function() {
  $(document).bind('ajaxSend', '#new_transaction', function(event, jqxhr, request, settings){
    $('#new_transaction').bootstrapValidator({
        message: 'This value is not valid',
        excluded: [':disabled'],
        fields: {
            'transaction[type_of_transaction]': {
                message: 'Debe elegir uno',
                validators: {
                    notEmpty: {
                        message: 'Debe elegir uno'
                    },
                }
            },
            'transaction[amount]': {
                message: 'Debe ser un valor numérico',
                validators: {
                    notEmpty: {
                        message: 'No puede estar vacío'
                      }
                    }
                  },
              'transaction[date]': {
                  message: 'The username is not valid',
                  validators: {
                      notEmpty: {
                          message: 'No puede estar vacío'
                        }
                      }
                    },
              'transaction[concept]': {
                  message: 'The username is not valid',
                  validators: {
                      notEmpty: {
                          message: 'No puede estar vacío'
                        }
                      }
                    }

        }
    });

$('form#new_transaction').on('success.form.bv', function(e) {
        // Called when the form is valid
        var $form = $(e.target);
        if ($form.data('remote') && $.rails !== undefined) {
            e.preventDefault();
        }
    });




(function($) {

  $.fn.modal_win = function(){
    this.modal('hide');
    this.find('form input').val('');
  };

}(jQuery));

})
});
