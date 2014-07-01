Topaz.Views.CommentsShow = Backbone.View.extend({
	template: JST["comments/show"],
	id: this.id,
	initialize: function(options){
		this.article = options.article;
		this.paragraph = options.paragraph;
		this.comments = options.comments;
		this.id = options.id;
	},
	events: {
		"submit form": "submit"
	},
	render: function(){
		var renderedContent = this.template({
			article: this.article,
			paragraph: this.paragraph,
			comments: this.comments,
			id: this.id
		});
		this.$el.html(renderedContent);
		return this;
	},
	submit: function(event){
    event.preventDefault();
	}
});