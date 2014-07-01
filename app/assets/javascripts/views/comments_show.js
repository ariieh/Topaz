Topaz.Views.CommentsShow = Backbone.View.extend({
	template: JST["comments/show"],
	tagName: "div",
	id: this.id,
	initialize: function(options){
		this.article = options.article;
		this.paragraph = options.paragraph;
		this.id = options.id;
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