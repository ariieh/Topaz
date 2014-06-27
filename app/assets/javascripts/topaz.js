window.Topaz = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    new Topaz.Routers.Router({
    	$contentEl: $("#content"),
			$sidebarEl: $(".sidebar")
    });
    Backbone.history.start();
  }
};

$(document).ready(function(){
  Topaz.initialize();
	
	var selectColor = "#e74c3c";
	
	$("nav .fa-tasks").click(function() {
	  $(".notifications").fadeOut("fast");
	  $(".search-bar").fadeOut("fast");
	  $(".menu-bar").fadeToggle("fast");
	});
  
	$("nav .fa-flag").click(function() {
	  $(".menu-bar").fadeOut("fast");
	  $(".search-bar").fadeOut("fast");
	  $(".notifications").fadeToggle("fast");
	});
	
	$("nav .fa-search").click(function() {
	  $(".menu-bar").fadeOut("fast");
	  $(".notifications").fadeOut("fast");
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
