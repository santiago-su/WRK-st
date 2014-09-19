onLoad(function() {
  $('form').bootstrapValidator();

  $('form').on('success.form.bv', function(e) {
    // Called when the form is valid
    var $form = $(e.target);
    if ($form.data('remote') && $.rails !== undefined) {
      e.preventDefault();
    }
  });
});
