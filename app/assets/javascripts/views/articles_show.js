Topaz.Views.ArticlesShow = Backbone.View.extend({
	initialize: function(options){
		this.$contentEl = options.$contentEl;
		this.$sidebarEl = options.$sidebarEl;
	},
	template: JST["articles/show"],
	render: function(){
		var renderedContent = this.template({
			article: this.model
		});
		this.$contentEl.html(renderedContent);
		return this;
	}
});