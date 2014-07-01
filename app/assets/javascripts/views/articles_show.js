Topaz.Views.ArticlesShow = Backbone.View.extend({
	initialize: function(options){
		this.user = options.user;
		this.listenTo(this.model,"sync add change remove",this.render);
	},
	events: {
		"click button": "favorite"
	},
	template: JST["articles/show"],
	render: function(){
		var that = this;
				
		var renderedContent = this.template({
			article: this.model,
			user: this.user,
			currentUser: window.currentUser
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
				that.model.set({votecount: response});
			}
		});
	},
	addSubviews: function(){
		var text = $(this.model.get("htmlbody"));
		var that = this;
		var i = 1;
		
		var bodytext = $("<div id='body-text'></div>")
		
		text.each(function(el){
			if ($(text[el]).is("p")){
		    var commentView = new Topaz.Views.CommentsShow({
		      article: that.model,
					paragraph: $(text[el]).text(),
					comments: that.model.comments(),
					id: i
		    });

				bodytext.append(commentView.render().$el);
				i++;
			}
		});
		
		this.$el.append(bodytext);
		
	}
});