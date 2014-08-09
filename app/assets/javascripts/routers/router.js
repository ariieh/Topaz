Topaz.Routers.Router = Backbone.Router.extend({
	initialize: function(options){
		this.$contentEl = options.$contentEl;
		this.$sidebarEl = options.$sidebarEl;
	},
	routes: {
		"": "articlesIndex",
		"articles/popular": "articlesIndexPopular",
		"articles/favorites": "articlesIndexFavorites",
		"articles/latest": "articlesIndex",
		"articles/new": "articlesNew",
		"articles/:id": "articlesShow",
		"articles/:id/edit": "articlesEdit",
		"users/:id": "usersShow",
		"tags/:name": "tagsShow",
		"search?query=:query":"search",
		"about": "about",
		"welcome": "welcome"
	},
	
	_indexTemplate: function(title, key, tagName, searchQuery, userID){
		$("#now-reading-tag").html(title);
		this._scrollUp();
		Topaz.pageLoaderShow();
		
		if (searchQuery !== null){
			$("#page-modal").css({"background":"transparent"});
		}
		
    var that = this;
		Topaz.Collections.articles.fetch({
			data: {page: 1, key: key, name: tagName, query: searchQuery, id: userID},
    	success: function(){
				that._swapPageView(key, tagName, searchQuery, userID);
    	}
    });
	},
	
	articlesIndex: function(){
		this._indexTemplate("LATEST", "created_at", null, null, null);
	},
	
	articlesIndexPopular: function(){
		this._indexTemplate("POPULAR", "votecount", null, null, null);
	},
	
	articlesIndexFavorites: function(){
		if (window.currentUserId){
			this._indexTemplate("FAVORITES", "favorites", null, null, null);
		} else {
			alert("Sign in to see your favorites!");
		}
	},
	
	tagsShow: function(name){
		this._indexTemplate(name.toUpperCase(), "tag", name, null, null);
	},
	
	articlesNew: function(){
		$("#now-reading-tag").html("NEW ARTICLE");
		this._scrollUp();
		
		var article = new Topaz.Models.Article();
		var newView = new Topaz.Views.ArticlesForm({
			model: article
		});
		this._swapContentView(newView);
	},
	
	articlesShow: function(id){
		this._scrollUp();
		var that = this;
    var article = Topaz.Collections.articles.getOrFetch(id, function(){
	    var showView = new Topaz.Views.ArticlesShow({
	      model: article
	    });
			
			$("#now-reading-tag").html(article.get("title"));

			if (that.currentSidebarView){
				that._removeSubviews(that.currentSidebarView);
				that.currentSidebarView.remove();
			}
	    that._swapContentView(showView);
    });
		
	},
	
	articlesEdit: function(id){
		$("#now-reading-tag").html("EDIT ARTICLE");
		this._scrollUp();
		
		var that = this;
    var article = Topaz.Collections.articles.getOrFetch(id, function(){
	    var editView = new Topaz.Views.ArticlesForm({
	      model: article
	    });
	    that._swapContentView(editView);
    });
	},
		
	usersShow: function(id){
		this._scrollUp();
		
		Topaz.pageLoaderShow();
    var that = this;

		var user = Topaz.Collections.users.getOrFetch(id, function(){
			var id = user.get("id");
	    var showView = new Topaz.Views.UsersShow({
	      model: user
	    });
			
			this._indexTemplate(user.get("username") + "'s articles", "user", null, null, id);
		});
	},
	
	search: function(query){
		this._indexTemplate(query.toUpperCase(), "search", null, query, null);				
	},
	
	about: function(){
		$("#now-reading-tag").html("ABOUT");
		this._scrollUp();
		
		var aboutView = new Topaz.Views.About();
    this._swapContentView(aboutView);
	},
	
	welcome: function(){
		$("#now-reading-tag").html("WELCOME");
		this._scrollUp();
		
		var welcomeView = new Topaz.Views.Welcome();
    this._swapContentView(welcomeView);
	},
	
	_swapPageView: function(key, tagName, query, userId){
    var indexView = new Topaz.Views.ArticlesIndex({
      collection: Topaz.Collections.articles,
			key: key
    });
    this._swapSidebarView(indexView);
	
    var showIndexView = new Topaz.Views.ArticlesShowIndex({
      collection: Topaz.Collections.articles,
			key: key,
			name: tagName,
			query: query,
			id: userId
    });
    this._swapContentView(showIndexView);
	},
	
	_scrollUp: function(){
		$('section.page').animate({scrollTop: 0}, "fast");
		$('section.sidebar').animate({scrollTop: 0}, "fast");
	},
	
	_swapContentView: function(view){
		if (this.currentContentView){
			this._removeSubviews(this.currentContentView);
			this.currentContentView.remove();
	    $("section.page").off("scroll");
		}
		this.$contentEl.html(view.render().$el);
		this.currentContentView = view;
		Topaz.pageLoaderHide();
		Topaz.scrollLoaderHide();
	},
	
	_swapSidebarView: function(view){
		if (this.currentSidebarView){
			this._removeSubviews(this.currentSidebarView);
			this.currentSidebarView.remove();
		};
		this.$sidebarEl.html(view.render().$el);
		this.currentSidebarView = view;
		Topaz.pageLoaderHide();
	},
	
	_removeSubviews: function(view){
		if (view.subviews){
			view.subviews.forEach(function(subview){
				subview.remove();
			});
		}
	}
});