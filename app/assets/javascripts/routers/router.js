Topaz.Routers.Router = Backbone.Router.extend({
	initialize: function(options){
		this.$contentEl = options.$contentEl,
		this.$sidebarEl = options.$sidebarEl
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
		"articles/tag/:id": "tagsShow"
	},
	
	articlesIndex: function(){
    var that = this;
		Topaz.Collections.articles.fetch({
    	success: function(){
		    var indexView = new Topaz.Views.ArticlesIndex({
		      collection: Topaz.Collections.articles
		    });
		    that._swapSidebarView(indexView);
				that._showFirst(Topaz.Collections.articles);
    	}
    });
	},
	
	articlesIndexPopular: function(){
    var that = this;
		Topaz.Collections.articles.fetch({
    	success: function(){
				Topaz.Collections.articles.sortByKey("votecount");
		    var indexView = new Topaz.Views.ArticlesIndex({
		      collection: Topaz.Collections.articles
		    });
		    that._swapSidebarView(indexView);
				that._showFirst(Topaz.Collections.articles);
    	}
    });
	},
	
	articlesIndexFavorites: function(){
		var that = this;
		if (window.currentUserId){
			$.ajax({
				url: Topaz.Collections.articles.url + "/favorites",
				success: function(data){
					var collection = new Topaz.Collections.Articles(data);
			    var indexView = new Topaz.Views.ArticlesIndex({
			      collection: collection
			    });
			    that._swapSidebarView(indexView);
					that._showFirst(collection);
				}
			});
		} else {
			alert("Sign in to see your favorites!");
		}
	},
	
	tagsShow: function(id){
		var that = this;
		$.ajax({
			url: Topaz.Collections.articles.url + "/tag/" + id,
			success: function(data){
				var collection = new Topaz.Collections.Articles(data);
		    var indexView = new Topaz.Views.ArticlesIndex({
		      collection: collection
		    });
		    that._swapSidebarView(indexView);
				that._showFirst(collection);
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
    var article = Topaz.Collections.articles.getOrFetch(id);
    var user = Topaz.Collections.users.getOrFetch(article.get("author_id"));
		
    var showView = new Topaz.Views.ArticlesShow({
      model: article,
			user: user
    });
    this._swapContentView(showView);
	},
	
	articlesEdit: function(id){
    var article = Topaz.Collections.articles.getOrFetch(id);
    var editView = new Topaz.Views.ArticlesForm({
      model: article
    });
    this._swapContentView(editView);
	},
	
	usersShow: function(id){
    var user = Topaz.Collections.users.getOrFetch(id);
    var showView = new Topaz.Views.UsersShow({
      model: user
    });
    this._swapContentView(showView);
	},
	
	_showFirst: function(collection){
		var article = collection.first();
    var user = Topaz.Collections.users.getOrFetch(article.get("author_id"));
    var showView = new Topaz.Views.ArticlesShow({
      model: article,
			user: user
    });
    this._swapContentView(showView);
	},
	
	_swapContentView: function(view){
		if (this.currentContentView) this.currentContentView.remove();
		this.$contentEl.html(view.render().$el);
		this.currentContentView = view;
	},
	
	_swapSidebarView: function(view){
		if (this.currentSidebarView) this.currentSidebarView.remove();
		this.$sidebarEl.html(view.render().$el);
		this.currentSidebarView = view;
	}
});