// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require jquery3
//= require popper
//= require bootstrap
//= require admin.min.js
//= require jquery-easing/jquery.easing.min.js
//= require datatables/jquery.dataTables.min.js
//= require datatables/dataTables.bootstrap4.min.js
//= require_tree .

$(document).on('turbolinks:load', function() {
  setTimeout(function() {
    $('#flash-messages').fadeOut('slow', function() {
      $(this).remove();
    })
  }, 2000);

  $('table.table-bordered').dataTable( {
    "scrollX": true,
    "order": []
  });

  bsCustomFileInput.init();

  // Toggle the side navigation
  $("#sidebarToggle, #sidebarToggleTop").on('click', function(e) {
    $("body").toggleClass("sidebar-toggled");
    $(".sidebar").toggleClass("toggled");
    if ($(".sidebar").hasClass("toggled")) {
      $('.sidebar .collapse').collapse('hide');
    };
  });
});