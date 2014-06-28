Topaz.Views.UsersShow = Backbone.View.extend({
	initialize: function(options){
		this.$contentEl = options.$contentEl;
		this.$sidebarEl = options.$sidebarEl;
	},
	template: JST["users/show"],
	render: function(){
		var that = this;
		var renderedContent = this.template({
			user: this.model
		});
		this.$contentEl.html(renderedContent);
		return this;
	}
});