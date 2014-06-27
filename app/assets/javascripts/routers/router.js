Topaz.Routers.Router = Backbone.Router.extend({
	initialize: function(options){
		this.$contentEl = options.$contentEl,
		this.$sidebarEl = options.$sidebarEl
	},
	routes: {
		"articles/new": "articlesNew"
	},
	
	articlesNew: function(){
		alert("hi")
		var article = new Topaz.Models.Article();
		var newView = new Topaz.Views.ArticlesForm({
			model: article
		});
		this._swapView(newView);
	},
	
	_swapView: function(view){
		if (this.currentView) this.currentView.remove();
		$contentEl.html(view.render().$el);
		this.currentView = view;
	}
});