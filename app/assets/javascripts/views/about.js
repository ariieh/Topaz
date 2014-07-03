Topaz.Views.About = Backbone.View.extend({
	template: JST["static/about"],
	render: function(){
		var renderedContent = this.template();
		this.$el.html(renderedContent);
		return this;
	}
});