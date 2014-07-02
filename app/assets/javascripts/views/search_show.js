Topaz.Views.SearchShow = Backbone.View.extend({
	initialize: function(options){
		this.data = options.data;
	},
	template: JST["search/show"],
	render: function(){
		var renderedContent = this.template({
			data: this.data
		});
		this.$el.html(renderedContent);
		return this;
	}
});