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
		"tags/:name": "tagsShow",
		"about": "about"
	},
	
	articlesIndex: function(){
		Topaz.pageLoaderShow();
    var that = this;
		Topaz.Collections.articles.fetch({
			data: {page: 1, key: "created_at"},
    	success: function(){
				// Topaz.Collections.articles.sortByKey("created_at");
		    var indexView = new Topaz.Views.ArticlesIndex({
		      collection: Topaz.Collections.articles,
					key: "created_at"
		    });
		    that._swapSidebarView(indexView);
				// that._showFirst(Topaz.Collections.articles);
				// that._showFirstX(Topaz.Collections.articles);
				
		    var showIndexView = new Topaz.Views.ArticlesShowIndex({
		      collection: Topaz.Collections.articles
		    });
		    that._swapContentView(showIndexView);
    	}
    });
	},
	
	articlesIndexPopular: function(){
		Topaz.pageLoaderShow();
    var that = this;
		Topaz.Collections.articles.fetch({
			data: {page: 1, key: "votecount"},
    	success: function(){
				// Topaz.Collections.articles.sortByKey("votecount");
		    var indexView = new Topaz.Views.ArticlesIndex({
		      collection: Topaz.Collections.articles,
					key: "votecount"
		    });
		    that._swapSidebarView(indexView);
				// that._showFirst(Topaz.Collections.articles);
				
		    var showIndexView = new Topaz.Views.ArticlesShowIndex({
		      collection: Topaz.Collections.articles
		    });
		    that._swapContentView(showIndexView);
    	}
    });
	},
	
	articlesIndexFavorites: function(){
		Topaz.pageLoaderShow();
		var that = this;
		if (window.currentUserId){

			Topaz.Collections.articles.fetch({
				data: {page: 1, key: "favorites"},
	    	success: function(){
					// var newCollection = new Topaz.Collections.Articles();
					//
					// window.currentUser.get("votes").forEach(function(fav){
					// 	newCollection.add(Topaz.Collections.articles.where({id: fav}));
					// });
					
					var indexView = new Topaz.Views.ArticlesIndex({
			      collection: Topaz.Collections.articles,
						key: "favorites"
			    });
			    that._swapSidebarView(indexView);
					// that._showFirst(Topaz.Collections.articles);
				
			    var showIndexView = new Topaz.Views.ArticlesShowIndex({
			      collection: Topaz.Collections.articles
			    });
			    that._swapContentView(showIndexView);
	    	}
	    });
			
			// $.ajax({
			// 	url: Topaz.Collections.articles.url + "/favorites",
			// 	success: function(data){
			// 		var collection = new Topaz.Collections.Articles(data);
			//     var indexView = new Topaz.Views.ArticlesIndex({
			//       collection: collection
			//     });
			//     that._swapSidebarView(indexView);
			// 		that._showFirst(collection);
			// 	}
			// });
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
					key: "tag",
					name: name
		    });
		    that._swapSidebarView(indexView);
				// that._showFirst(Topaz.Collections.articles);
				
		    var showIndexView = new Topaz.Views.ArticlesShowIndex({
		      collection: Topaz.Collections.articles
		    });
		    that._swapContentView(showIndexView);
    	}
    });
		
		
		// var that = this;
		// $.ajax({
		// 	url: Topaz.Collections.articles.url + "/tag/" + name,
		// 	success: function(data){
		// 		var collection = new Topaz.Collections.Articles(data);
		//     var indexView = new Topaz.Views.ArticlesIndex({
		//       collection: collection
		//     });
		//     that._swapSidebarView(indexView);
		// 		// that._showFirst(collection);
		//
		//     var showIndexView = new Topaz.Views.ArticlesShowIndex({
		//       collection: collection
		//     });
		//     that._swapContentView(showIndexView);
		// 	}
		// });
	},
	
	articlesNew: function(){
		var article = new Topaz.Models.Article();
		var newView = new Topaz.Views.ArticlesForm({
			model: article
		});
		this._swapContentView(newView);
	},
	
	articlesShow: function(id){
		// if (!this.currentSidebarView){
		// 	    var that = this;
		// 	Topaz.Collections.articles.fetch({
		// 		data: {page: 1, key: "created_at"},
		// 	    	success: function(){
		// 			Topaz.Collections.articles.sortByKey("created_at");
		// 	    var indexView = new Topaz.Views.ArticlesIndex({
		// 	      collection: Topaz.Collections.articles,
		// 				key: "created_at"
		// 	    });
		// 	    that._swapSidebarView(indexView);
		// 	    	}
		// 	    });
		// }
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
	    this._swapContentView(editView);
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
		});
		
		Topaz.Collections.articles.fetch({
			data: {page: 1, key: "user", id: id},
    	success: function(){
		    var indexView = new Topaz.Views.ArticlesIndex({
		      collection: Topaz.Collections.articles,
					key: "user",
					id: id
		    });
		    that._swapSidebarView(indexView);
				// var newCollection = new Topaz.Collections.Articles();
				//
				// user.get("articles").forEach(function(article){
				// 	newCollection.add(Topaz.Collections.articles.where({id: article}));
				// });
				//
				// var indexView = new Topaz.Views.ArticlesIndex({
				// 		      collection: newCollection
				// 		    });
				//
				// 		    that._swapSidebarView(indexView);
		    // that._swapContentView(showView);
		    var showIndexView = new Topaz.Views.ArticlesShowIndex({
		      collection: Topaz.Collections.articles
		    });
		    that._swapContentView(showIndexView);
				that.$contentEl.prepend(showView.render().$el);
    	}
    });
		
	},
	
	about: function(){
		var aboutView = new Topaz.Views.About();
    this._swapContentView(aboutView);
	},
	
	// _showFirst: function(collection){
	// 	var article = collection.first();
	//     var showView = new Topaz.Views.ArticlesShow({
	//       model: article
	//     });
	//     this._swapContentView(showView);
	// },
	//
	// _showFirstX: function(collection){
	// 	for (var i = 0; i < 10; i++){
	// 		var article = collection.at(i);
	//     var showView = new Topaz.Views.ArticlesShow({
	//       model: article
	//     });
	// 		if (i === 0){
	// 	    this._swapContentView(showView);
	// 		} else {
	// 			this.$contentEl.append(showView.render().$el);
	// 		}
	// 	}
	// },
	
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