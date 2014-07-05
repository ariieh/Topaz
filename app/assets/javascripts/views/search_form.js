Topaz.Views.SearchForm = Backbone.View.extend({
	initialize: function(options){
	},
	events: {
		"keyup .search-bar": "search"
	},
	template: JST["search/form"],
	render: function(){
		var renderedContent = this.template();
		this.$el.html(renderedContent);
		return this;
	},
	search: function(event){
		var formData = $(event.currentTarget).serializeJSON();
		Topaz.Routers.router.search(formData.query);
		
		
		// Topaz.pageLoaderShow();
		// $("#page-modal").css({"background":"transparent"});
		// event.preventDefault();
		// var that = this;
		// var formData = $(event.currentTarget).serializeJSON();
		// $.ajax({
		// 	url: "/api/search/?query=" + formData["query"],
		// 	success: function(data){
		// 		// 		    var searchView = new Topaz.Views.SearchShow({
		// 		// 		      data: data
		// 		// 		    });
		// 		// $('#content').html(searchView.render().$el);
		//
		// 		var searchCollection = new Topaz.Collections.Articles(data.articles);
		//
		//     var indexView = new Topaz.Views.ArticlesIndex({
		//       collection: searchCollection
		//     });
		//     Topaz.Routers.router._swapSidebarView(indexView);
		// 		// that._showFirst(Topaz.Collections.articles);
		//
		//     var showIndexView = new Topaz.Views.ArticlesShowIndex({
		//       collection: searchCollection,
		// 			key: "query",
		// 			data: formData["query"]
		//     });
		//     Topaz.Routers.router._swapContentView(showIndexView);
		//
		// 	}
		// });
	}
});