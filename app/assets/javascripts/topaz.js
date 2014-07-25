window.Topaz = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
		Topaz.Collections.articles = new Topaz.Collections.Articles();
		Topaz.Collections.users = new Topaz.Collections.Users();
		
		if (window.currentUserId){
			window.currentUser = new Topaz.Models.User({id: window.currentUserId});
		
			$.when(window.currentUser.fetch()).done(function(){
				Topaz.Routers.router = new Topaz.Routers.Router({
		    	$contentEl: $("#content"),
					$sidebarEl: $(".sidebar"),
					isInitial: true
		    });
		    Backbone.history.start();
			
				var searchView = new Topaz.Views.SearchForm();
				$(".search-li").html(searchView.render().$el);
			
				var notificationView = new Topaz.Views.NotificationShow();
				$(".notifications-li").append(notificationView.render().$el);
			});
			} else {
				Topaz.Routers.router = new Topaz.Routers.Router({
		    	$contentEl: $("#content"),
					$sidebarEl: $(".sidebar"),
					isInitial: true
		    });
		    Backbone.history.start();
			
				var searchView = new Topaz.Views.SearchForm();
				$(".search-li").html(searchView.render().$el);
		}
  },
	
	pageLoaderShow: function(){
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
		$("#page-modal").fadeTo("fast", 0.8);		
		Topaz.pageSpinner = (new Spinner(opts).spin());
		$("#page-modal").append(Topaz.pageSpinner.el);
	},
	
	pageLoaderHide: function(){
		$("#page-modal").fadeOut("fast", function(){
			$("#page-modal").css({"background":"#95a5a6"});
		});
	},
	
	scrollLoaderShow: function(){
		var opts = {
		  lines: 13, // The number of lines to draw
		  length: 30, // The length of each line
		  width: 10, // The line thickness
		  radius: 25, // The radius of the inner circle
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
		$("#scroll-modal").fadeTo("fast", 0.8);
		Topaz.scrollSpinner = (Topaz.scrollSpinner || new Spinner(opts).spin());
		$("#scroll-modal").append(Topaz.scrollSpinner.el);
	},
	
	scrollLoaderHide: function(){
		$("#scroll-modal").fadeOut("fast");
	},
	
	flashFormErrors: function(errors){
		$("input[name='article[title]']").removeClass("error");
		$("textarea[name='article[body]']").removeClass("error");
		
		$("#page-modal").empty();
		$("#page-modal").fadeTo("fast", 0.8);
		alerts = $("<ul id='alerts'></ul>");
		
		errors.forEach(function(error){
			alerts.append("<li>"+error+"</li>");
		});
		
		$("#page-modal").append(alerts);
		
		window.setTimeout(function(){
			Topaz.pageLoaderHide();
			$("#page-modal").empty();
			$('section.page').animate({scrollTop: 0}, "fast");
			
			errors.forEach(function(error){
				error = error.toLowerCase();
				
				if (error.indexOf("title") !== -1){
					$("input[name='article[title]']").addClass("error");
				}
				
				if (error.indexOf("body") !== -1){
					$("textarea[name='article[body]']").addClass("error");
				}
			});
		}, 1000)
	}
};

$(document).ready(function(){
  jQuery("abbr.timeago").timeago();
	var height = $(window).height();
	var width = $(window).width();
	
	var selectColor = "#168dd9";
	
	$("body").on("keydown", function(event) {	
		if ( event.ctrlKey && ( event.which === 65 ) ) {
			if ($('canvas').css("z-index") == -1){
				$.when(
					$.getScript( "asteroids/keymaster.js" ),
					$.getScript( "asteroids/moving_object.js" ),
					$.getScript( "asteroids/bullet.js" ),
					$.getScript( "asteroids/asteroids.js" ),
					$.getScript( "asteroids/ship.js" ),
					$.getScript( "asteroids/game.js" )
				).done(function( script, textStatus ) {
		        var canvas = document.getElementsByTagName("canvas")[0];
		        var asteroids = document.getElementsByClassName("asteroid");
		        var spaceship = document.getElementById("spaceship");
		        var enemyShip = document.getElementById("enemyShip");
		        var missile = document.getElementById("missile");
		        var football = document.getElementById("football");
			      $('canvas').css({"z-index": "9999"});
						$('canvas').attr({"width":width,"height":height});
			      window.game = new Asteroids.Game(width, height, 15, 2, asteroids, spaceship, enemyShip, missile, football);
						window.game.start(canvas);
				 });
			} else {
				$('canvas').css({"z-index": "-1"});
				window.game.stopGame();
				delete window.game
			}
		}
	});	  
		
	$("body").click(function(event) {
		if($(event.target).is('i.fa-tasks')) {
		  $(".menu-bar").fadeToggle("fast");
		} else {
			$(".menu-bar").fadeOut("fast");
		}
		
		if($(event.target).is('i.fa-flag')) {
		  $(".notifications").fadeToggle("fast");
		} else {
			$(".notifications").fadeOut("fast");
		}
		
		if($(event.target).is('nav .fa-search')) {
		  $(".search-bar").fadeToggle("fast");
		} else if (!$(event.target).is('.search-bar')) {
		  $(".search-bar").fadeOut("fast", function(){
			  $(".search-bar").val("");
		  });
		}
		
		if($(event.target).is('#tag-div .fa-search')) {
		  $("#tag-search-bar").fadeToggle("fast");
		} else if (!$(event.target).is('#tag-search-bar')) {
		  $("#tag-search-bar").fadeOut("fast", function(){
			  $("#tag-search-bar").val("");
		  });
		}
		
		if(!$(event.target).closest('.comment-button').length &&
		   !$(event.target).closest('.comment-box').length){
			  $(".comment-box").fadeOut("fast");
		}
		
		if($(event.target).is('.show-modal')) {
			event.preventDefault();
			window.showModal();
		}
		
		if($(event.target).is('.hide-modal')) {
			window.hideModal();
		}		
		
	});

	$('nav .fa, .logo a').hover(
	    function() {
	        $(this).animate({'color': selectColor}, 'fast');
	    }, 
	    function() {
	        $(this).animate({'color': "white"}, 'fast');
	    }
	);
	
	$("#expand").on("click", function(event){
    window.getSelection().removeAllRanges();
		
		$("section.tagbar").toggleClass("hidden", 100);
		
	  if ($(event.currentTarget).is(".fa-minus-circle")) {
			$(event.currentTarget).switchClass("fa-minus-circle", "fa-plus-circle", 100)
			$("section.main").toggleClass("expanded", 100);
	  } else {
			$(event.currentTarget).switchClass("fa-plus-circle", "fa-minus-circle", 100)
			$("section.main").toggleClass("expanded", 100);
	  }
	});
	
	$("#tag-search-form").submit( function(event){
    event.preventDefault();
		Backbone.history.navigate("tags/" + $("#tag-search-bar").val(), {trigger: true});
	});
	
});