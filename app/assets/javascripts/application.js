// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require turbolinks
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require bootstrapValidator.min
//= require_self
//= require_tree .

window.onLoad = function(callback) {
  // binds ready event and turbolink page:load event
  $(document).ready(callback);
  $(document).on('page:load', callback);
};

window.sortTable = function(table, dataKey) {
  var rows = $(table).find("tbody tr");
  var sorted = rows.sort(function(a, b) {
    var a = "" + $(a).data(dataKey),
        b = "" + $(b).data(dataKey);
    return a.localeCompare(b);
  });
  $(table).find("tbody").html(sorted);
}

window.displayAlert = function(text) {
  var alert = $('<div class="alert alert-success alert-dismissible"></div>').
    html('<button type="button" class="close" data-dismiss="alert"><span>&times;</span><span class="sr-only">Close</span></button>').
    append(text).hide().appendTo($("#alerts")).fadeIn();
  setTimeout(function () { alert.fadeOut(); }, 5000);
}

onLoad(function() {

  // Por alguna estupida razon hay que poner esta inicialización de
  // bootstrapValidator en un thread aparte para que funcione.
  setTimeout(function () {
    $('form').bootstrapValidator();

    $('form').on('success.form.bv', function(e) {
      // Called when the form is valid
      var $form = $(e.target);
      if ($form.data('remote') && $.rails !== undefined) {
        e.preventDefault();
      }
    });
  }, 0);

});
