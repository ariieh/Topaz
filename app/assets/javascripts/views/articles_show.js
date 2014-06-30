Topaz.Views.ArticlesShow = Backbone.View.extend({
	initialize: function(options){
		this.user = options.user;
	},
	template: JST["articles/show"],
	render: function(){
		var that = this;
		var renderedContent = that.template({
			article: this.model,
			user: this.user
		});
		this.$el.html(renderedContent);
		return this;
	}
});