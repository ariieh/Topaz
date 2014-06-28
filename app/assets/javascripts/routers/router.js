Topaz.Routers.Router = Backbone.Router.extend({
	initialize: function(options){
		this.$contentEl = options.$contentEl,
		this.$sidebarEl = options.$sidebarEl
	},
	routes: {
		"": "articlesIndex",
		"articles/new": "articlesNew",
		"articles/:id": "articlesShow",
		"articles/:id/edit": "articlesEdit"
	},
	
	articlesIndex: function(){
    var that = this;
		Topaz.Collections.articles.fetch({
    	success: function(){
		    var indexView = new Topaz.Views.ArticlesIndex({
					$contentEl: that.$contentEl,
					$sidebarEl: that.$sidebarEl,
		      collection: Topaz.Collections.articles
		    });
		    that._swapView(indexView);
    	}
    });
	},
	
	articlesNew: function(){
		var article = new Topaz.Models.Article();
		var newView = new Topaz.Views.ArticlesForm({
			$contentEl: this.$contentEl,
			$sidebarEl: this.$sidebarEl,
			model: article
		});
		this._swapView(newView);
	},
	
	articlesShow: function(id){
    var article = Topaz.Collections.articles.getOrFetch(id);
    var showView = new Topaz.Views.ArticlesShow({
			$contentEl: this.$contentEl,
			$sidebarEl: this.$sidebarEl,
      model: article
    });
    this._swapView(showView);
	},
	
	articlesEdit: function(id){
    var article = Topaz.Collections.articles.getOrFetch(id);
    var editView = new Topaz.Views.ArticlesForm({
			$contentEl: this.$contentEl,
			$sidebarEl: this.$sidebarEl,
      model: article
    });
    this._swapView(editView);
	},
	
	_swapView: function(view){
		if (this.currentView) this.currentView.remove();
		view.render();
		this.currentView = view;
	}
});