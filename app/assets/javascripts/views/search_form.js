Topaz.Views.SearchForm = Backbone.View.extend({
	initialize: function(options){
	},
	events: {
		"submit form": "search"
	},
	template: JST["search/form"],
	render: function(){
		var renderedContent = this.template();
		this.$el.html(renderedContent);
		return this;
	},
	search: function(event){
		event.preventDefault();
		var that = this;
		var formData = $(event.currentTarget).serializeJSON();
		$.ajax({
			url: "/api/search/?query=" + formData["query"],
			success: function(data){
		    var searchView = new Topaz.Views.SearchShow({
		      data: data
		    });
				$('#content').html(searchView.render().$el);
			}
		});
	}
});