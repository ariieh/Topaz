Topaz.Views.ArticlesShow = Backbone.View.extend({
	initialize: function(options){
		this.user = options.user;
		this.listenTo(this.model, "sync add change remove", this.render);
		this.subviews = [];
	},
	className: "article-show-container",
	events: {
		"click button": "favorite"
	},
	template: JST["articles/show"],
	render: function(){
		var that = this;
		
		var renderedContent = this.template({
			article: this.model,
			user: this.user
		});
		
		this.$el.html(renderedContent);
		this.addSubviews();
		return this;
	},
	favorite: function(event) {
		event.preventDefault();
		var that = this;
		
		$.ajax({
			type: "post",
			url: Topaz.Collections.articles.url + "/" + this.model.get("id") + "/votes",
			success: function(response){
				if (window.currentUser.get("votes")){
					window.currentUser.get("votes").push(that.model.id);
					window.currentUser.set(
						{votes: window.currentUser.get("votes")});
				} else {
					window.currentUser.set({votes: [that.model.id]});
				}
				that.model.set({votecount: response});
			}
		});
	},
	addSubviews: function(){
		var text = $(this.model.get("htmlbody"));
		var bodytext = $("<div id='body-text'></div>");
		var that = this;
		var i = 1;
		
		text.each(function(el){
			if ($(text[el]).is("p")){
		    var commentView = new Topaz.Views.CommentsShow({
		      article: that.model,
					paragraph: $(text[el]).text(),
					comments: that.model.comments().where({p_id: i, article_id: that.model.get("id")}),
					id: i
		    });
				that.subviews.push(commentView);
				bodytext.append(commentView.render().$el);
				i++;
			}
		});
		
		this.$el.append(bodytext);
	}
});