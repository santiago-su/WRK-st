$(document).ready(function() {
  $(document).bind('ajaxSend', '#new_client', function(event, jqxhr, request, settings){
    $('#new_client').bootstrapValidator({
        message: 'This value is not valid',
        excluded: [':disabled'],
        fields: {
            'client[name]': {
                message: 'The username is not valid',
                validators: {
                    notEmpty: {
                        message: 'No puede estar vacío'
                    },
                }
            },
            'client[meeting_office_hours]': {
                message: 'Debe ser un valor numérico',
                validators: {
                    notEmpty: {
                        message: 'No puede estar vacío'
                      }
                    }
                  },
              'client[location]': {
                  message: 'The username is not valid',
                  validators: {
                      notEmpty: {
                          message: 'No puede estar vacío'
                        }
                      }
                    },
              'client[entry_date]': {
                  message: 'The username is not valid',
                  validators: {
                      notEmpty: {
                          message: 'No puede estar vacío'
                        }
                      }
                    }

        }
    });

$('form#new_client').on('success.form.bv', function(e) {
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


  $(document).bind('ajaxSend', '#editt_form', function(event, jqxhr, settings, exception){
    $('#editt_form').bootstrapValidator({
        message: 'This value is not valid',
        fields: {
            'client[name]': {
                message: 'The username is not valid',
                validators: {
                    notEmpty: {
                        message: 'No puede estar vacío'
                    },
                }
            },
            'client[meeting_office_hours]': {
                message: 'Debe ser un valor numérico',
                validators: {
                    notEmpty: {
                        message: 'No puede estar vacío'
                      }
                    }
                  },
              'client[location]': {
                  message: 'The username is not valid',
                  validators: {
                      notEmpty: {
                          message: 'No puede estar vacío'
                        }
                      }
                    },
              'client[entry_date]': {
                  message: 'The username is not valid',
                  validators: {
                      notEmpty: {
                          message: 'No puede estar vacío'
                        }
                      }
                    }

        }
    });

$('#editt_form').on('success.form.bv', function(e) {
        // Called when the form is valid
        var $form = $(e.target);
        if ($form.data('remote') && $.rails !== undefined) {
            e.preventDefault();
        }
    });
  });
});
