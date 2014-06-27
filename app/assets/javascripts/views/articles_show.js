Topaz.Views.ArticlesShow = Backbone.View.extend({
	template: JST["articles/show"],
	render: function(){
		var renderedContent = this.template({
			article: this.model
		});
		this.$el.html(renderedContent);
		return this;
	}
});