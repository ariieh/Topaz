Topaz.Views.ArticlesForm = Backbone.View.extend({
	template: JST["articles/form"],
	events: {
		"submit form": "submit"
	},
	render: function(){
		var renderedContent = this.template({
			article: this.model
		});
		this.$el.html(renderedContent);
		return this;
	},
	submit: function(event){
		event.preventDefault();
	}
});