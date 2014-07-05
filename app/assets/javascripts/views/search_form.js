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
	}
});