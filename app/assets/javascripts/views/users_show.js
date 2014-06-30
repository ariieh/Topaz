Topaz.Views.UsersShow = Backbone.View.extend({
	initialize: function(options){
	},
	template: JST["users/show"],
	render: function(){
		var that = this;
		var renderedContent = this.template({
			user: this.model
		});
		this.$el.html(renderedContent);
		return this;
	}
});