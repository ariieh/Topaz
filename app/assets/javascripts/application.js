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
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require jquery.color-2.1.2.min
//= require turbolinks
//= require_tree .

$(document).ready(function(){

	var selectColor = "#e74c3c";
	
	$(".fa-tasks").click(function() {
	  $(".menu-bar").fadeToggle("fast");
	});
  
	$(".fa-flag").click(function() {
	  $(".notifications").fadeToggle("fast");
	});
	
	$('.fa, .logo a').hover(
	    function() {
	        $(this).animate({'color': selectColor}, 'fast');
	    }, 
	    function() {
	        $(this).animate({'color': "white"}, 'fast');
	    }
	);
	
	
});