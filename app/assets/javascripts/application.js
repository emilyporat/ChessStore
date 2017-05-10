// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery 
//= require jquery_ujs
//= require foundation.min
//= require_tree .
//= require jquery_nested_form
//= require turbolinks


$(function() {
  $(document).foundation('topbar', 'reflow');
});

// Flash fade
$(function() {
   $('.alert-box').fadeIn('normal', function() {
      $(this).delay(3000).fadeOut();
   });
}); 

$( function() {
  $( "#tabs" ).tabs();
} );

function openItem(cityName) {
    var i;
    var x = document.getElementsByClassName("item");
    for (i = 0; i < x.length; i++) {
        x[i].style.display = "none"; 
    }
    document.getElementById(cityName).style.display = "block"; 
}