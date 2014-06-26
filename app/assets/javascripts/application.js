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
//= require jquery.ba-outside-events.min
//= require turbolinks
//= require_tree .

$(document).ready(function(){

	var selectColor = "#e74c3c";
	
	$("nav .fa-tasks").click(function() {
	  $(".menu-bar").fadeToggle("fast");
	});
  
	$("nav .fa-flag").click(function() {
	  $(".notifications").fadeToggle("fast");
	});
	
	$("nav .fa-search").click(function() {
	  $(".search-bar").fadeToggle("fast");
	});
  
  // buggy
  // $(".fa-flag").bind("clickoutside", function(event){
  //   $(".notifications").fadeOut("fast");
  // });
  //
  // $(".fa-tasks").bind("clickoutside", function(event){
  //   $(".menu-bar").fadeOut("fast");
  // });
	
	$('nav .fa, .logo a').hover(
	    function() {
	        $(this).animate({'color': selectColor}, 'fast');
	    }, 
	    function() {
	        $(this).animate({'color': "white"}, 'fast');
	    }
	);
	
	$('.comment-button').click(function(){
		$(".comment-box").not($(this).siblings()).hide();
		$(this).siblings(".comment-box").fadeToggle("fast");
	});
});