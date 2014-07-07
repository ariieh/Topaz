Topaz.Routers.Router = Backbone.Router.extend({
	initialize: function(options){
		this.$contentEl = options.$contentEl,
		this.$sidebarEl = options.$sidebarEl,
		this.isInitial = options.isInitial
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
		"about": "about"
	},
	
	articlesIndex: function(){
		Topaz.pageLoaderShow();
    var that = this;
		if (this.isInitial){
			this.isInitial = false;
	    var indexView = new Topaz.Views.ArticlesIndex({
	      collection: Topaz.Collections.articles,
				key: "created_at"
	    });
	    that._swapSidebarView(indexView);
		
	    var showIndexView = new Topaz.Views.ArticlesShowIndex({
	      collection: Topaz.Collections.articles,
				key: "created_at"
	    });
	    that._swapContentView(showIndexView);
		} else {
			Topaz.Collections.articles.fetch({
				data: {page: 1, key: "created_at"},
	    	success: function(){
			    var indexView = new Topaz.Views.ArticlesIndex({
			      collection: Topaz.Collections.articles,
						key: "created_at"
			    });
			    that._swapSidebarView(indexView);
				
			    var showIndexView = new Topaz.Views.ArticlesShowIndex({
			      collection: Topaz.Collections.articles,
						key: "created_at"
			    });
			    that._swapContentView(showIndexView);
	    	}
	    });
		}
	},
	
	articlesIndexPopular: function(){
		Topaz.pageLoaderShow();
    var that = this;
		Topaz.Collections.articles.fetch({
			data: {page: 1, key: "votecount"},
    	success: function(){
		    var indexView = new Topaz.Views.ArticlesIndex({
		      collection: Topaz.Collections.articles,
					key: "votecount"
		    });
		    that._swapSidebarView(indexView);
				
		    var showIndexView = new Topaz.Views.ArticlesShowIndex({
		      collection: Topaz.Collections.articles,
					key: "votecount"
		    });
		    that._swapContentView(showIndexView);
    	}
    });
	},
	
	articlesIndexFavorites: function(){
		console.log(window.currentUserId)
		if (window.currentUserId){
			Topaz.pageLoaderShow();
			var that = this;
			Topaz.Collections.articles.fetch({
				data: {page: 1, key: "favorites"},
	    	success: function(){					
					var indexView = new Topaz.Views.ArticlesIndex({
			      collection: Topaz.Collections.articles,
						key: "favorites"
			    });
			    that._swapSidebarView(indexView);
				
			    var showIndexView = new Topaz.Views.ArticlesShowIndex({
			      collection: Topaz.Collections.articles,
						key: "favorites"
			    });
			    that._swapContentView(showIndexView);
	    	}
	    });
		} else {
			alert("Sign in to see your favorites!");
		}
	},
	
	tagsShow: function(name){
		Topaz.pageLoaderShow();
    var that = this;
		Topaz.Collections.articles.fetch({
			data: {page: 1, key: "tag", name: name},
    	success: function(){
		    var indexView = new Topaz.Views.ArticlesIndex({
		      collection: Topaz.Collections.articles,
					key: "tag"
		    });
		    that._swapSidebarView(indexView);
				
		    var showIndexView = new Topaz.Views.ArticlesShowIndex({
		      collection: Topaz.Collections.articles,
					key: "tag",
					name: name
		    });
		    that._swapContentView(showIndexView);
    	}
    });
	},
	
	articlesNew: function(){
		var article = new Topaz.Models.Article();
		var newView = new Topaz.Views.ArticlesForm({
			model: article
		});
		this._swapContentView(newView);
	},
	
	articlesShow: function(id){
		var that = this;
    var article = Topaz.Collections.articles.getOrFetch(id, function(){
	    var showView = new Topaz.Views.ArticlesShow({
	      model: article
	    });
			if (that.currentSidebarView){
				that._removeSubviews(that.currentSidebarView);
				that.currentSidebarView.remove();
			}
	    that._swapContentView(showView);
    });
		
	},
	
	articlesEdit: function(id){
		var that = this;
    var article = Topaz.Collections.articles.getOrFetch(id, function(){
	    var editView = new Topaz.Views.ArticlesForm({
	      model: article
	    });
	    that._swapContentView(editView);
    });
	},
		
	usersShow: function(id){
		Topaz.pageLoaderShow();
    var that = this;
		
		var user = Topaz.Collections.users.getOrFetch(id, function(){
			var id = user.get("id");
	    var showView = new Topaz.Views.UsersShow({
	      model: user
	    });
			
			Topaz.Collections.articles.fetch({
				data: {page: 1, key: "user", id: id},
	    	success: function(){
			    var indexView = new Topaz.Views.ArticlesIndex({
			      collection: Topaz.Collections.articles,
						key: "user"
			    });
			    that._swapSidebarView(indexView);
			    var showIndexView = new Topaz.Views.ArticlesShowIndex({
			      collection: Topaz.Collections.articles,
						key: "user",
						id: id
			    });
			    that._swapContentView(showIndexView);
					that.$contentEl.prepend(showView.render().$el);
	    	}
	    });
			
		});
		
		
	},
	
	search: function(query){
		$("#page-modal").css({"background":"transparent"});
		Topaz.pageLoaderShow();
		
    var that = this;
		Topaz.Collections.articles.fetch({
			data: {page: 1, key: "search", query: query},
    	success: function(){
		    var indexView = new Topaz.Views.ArticlesIndex({
		      collection: Topaz.Collections.articles,
					key: "search"
		    });
		    that._swapSidebarView(indexView);
				
		    var showIndexView = new Topaz.Views.ArticlesShowIndex({
		      collection: Topaz.Collections.articles,
					key: "search",
					query: query
		    });
		    that._swapContentView(showIndexView);				
    	}
    });
		
	},
	
	about: function(){
		var aboutView = new Topaz.Views.About();
    this._swapContentView(aboutView);
	},
	
	_swapContentView: function(view){
		if (this.currentContentView){
			this._removeSubviews(this.currentContentView);
			this.currentContentView.remove();
	    $("section.page").off("scroll");
		}
		this.$contentEl.html(view.render().$el);
		this.currentContentView = view;
		$('section.page').animate({scrollTop: 0}, "fast");
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
		$('section.sidebar').animate({scrollTop: 0}, "fast");
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