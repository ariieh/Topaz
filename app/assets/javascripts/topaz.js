window.Topaz = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
		Topaz.Collections.articles = new Topaz.Collections.Articles();
		Topaz.Collections.users = new Topaz.Collections.Users();
		window.currentUser = new Topaz.Models.User({id: window.currentUserId});
		
		$.when(window.currentUser.fetch(),
		Topaz.Collections.users.fetch(),
		Topaz.Collections.articles.fetch({data: {page: 1, key: "created_at"} })).done(function(){
			Topaz.Routers.router = new Topaz.Routers.Router({
	    	$contentEl: $("#content"),
				$sidebarEl: $(".sidebar")
	    });
	    Backbone.history.start();
			
			var searchView = new Topaz.Views.SearchForm();
			$(".search-li").html(searchView.render().$el);
			
			if (window.currentUserId){
				var notificationView = new Topaz.Views.NotificationShow();
				$(".notifications-li").append(notificationView.render().$el);
			}
		});
		
  },
	loaderShow: function(){
		var opts = {
		  lines: 13, // The number of lines to draw
		  length: 100, // The length of each line
		  width: 25, // The line thickness
		  radius: 70, // The radius of the inner circle
		  corners: 1, // Corner roundness (0..1)
		  rotate: 0, // The rotation offset
		  direction: 1, // 1: clockwise, -1: counterclockwise
		  color: '#000', // #rgb or #rrggbb or array of colors
		  speed: 1, // Rounds per second
		  trail: 52, // Afterglow percentage
		  shadow: false, // Whether to render a shadow
		  hwaccel: false, // Whether to use hardware acceleration
		  className: 'spinner', // The CSS class to assign to the spinner
		  zIndex: 2e9, // The z-index (defaults to 2000000000)
		  top: '50%', // Top position relative to parent
		  left: '50%' // Left position relative to parent
		};
		
		$("#page-modal").addClass("visible");
		Topaz.spinner = (Topaz.spinner || new Spinner(opts).spin());
		$("#page-modal").append(Topaz.spinner.el);
	},
	loaderHide: function(){
		$("#page-modal").removeClass("visible");
	}
};

$(document).ready(function(){
  jQuery("abbr.timeago").timeago();
	
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

	/* rails only */
	$('.comment-button').click(function(){
		$(".comment-box").not($(this).siblings()).hide();
		$(this).siblings(".comment-box").fadeToggle("fast");
	});
});