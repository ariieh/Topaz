Topaz.Routers.Router = Backbone.Router.extend({
	initialize: function(options){
		this.$contentEl = options.$contentEl,
		this.$sidebarEl = options.$sidebarEl
	},
	routes: {
		"articles/new": "articlesNew"
	},
	
	articlesNew: function(){
		var article = new Topaz.Models.Article();
		var newView = new Topaz.Views.ArticlesNew();
		this._swapView(newView);
	},
	
	_swapView: function(view){
		if (this.currentView) this.currentView.remove();
		this.$contentEl.html(view.render().$el);
		this.currentView = view;
	}
});