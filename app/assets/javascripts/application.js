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
//= require materialize-sprockets
//= require materialize-form

$(function() {
  $(document).foundation('topbar', 'reflow');
});


function showDiv() {
   document.getElementById('welcomeDiv').style.display = "block";
}

$( function() {
	$( "#tabs" ).tabs();
} );

$(document).ready(function(){
  $('ul.tabs').tabs();
});

$(document).ready(function(){
  $('ul.tabs').tabs('select_tab', 'tab_id');
});

$(document).ready(function() {
  window.materializeForm.init()
});

$(document).ready(function() {
  $('select').material_select();
});

$(document).on('turbolinks:load', function() {
  $('select').material_select();
})

$('select').material_select('destroy');


