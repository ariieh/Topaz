Topaz.Views.ArticlesIndex = Backbone.View.extend({
	template: JST["articles/index"],
	render: function(){
		var renderedContent = this.template({
			articles: this.collection
		});
		this.$el.html(renderedContent);
		return this;
	}
});