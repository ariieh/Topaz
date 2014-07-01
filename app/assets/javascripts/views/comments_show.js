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
		"submit form": "submit",
		"click .comment-button": "reveal"
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
		var formData = $(event.currentTarget).serializeJSON();
    var newComment = new Topaz.Models.Comment(formData["comment"]);
		newComment.urlRoot = "/api/articles/" + this.article.get("id") + "/comments";
		var that = this;

    newComment.save({}, {
      success: function () {
				that.comments.push(newComment);
				that.render();
      }
    });
		
	},
	reveal: function(event){
		$(".comment-box").not($(event.currentTarget).siblings()).hide();
		$(event.currentTarget).siblings(".comment-box").fadeToggle("fast");
	}
});