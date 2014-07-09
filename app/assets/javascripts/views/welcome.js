Topaz.Views.Welcome = Backbone.View.extend({
	template: JST["static/welcome"],
	render: function(){
		var renderedContent = this.template();
		this.$el.html(renderedContent);
		return this;
	}
});