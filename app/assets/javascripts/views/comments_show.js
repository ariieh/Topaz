Topaz.Views.CommentShow = Backbone.View.extend({
	template: JST["comments/show"],
	initialize: function(options){
	},
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