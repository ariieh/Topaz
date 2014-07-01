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
	  var currentUser = Topaz.Collections.users.getOrFetch(window.currentUserId, function(){
			var renderedContent = that.template({
				article: that.model,
				user: that.user,
				currentUser: currentUser
			});
			that.$el.html(renderedContent);
	  });
		// this.addSubviews();
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
		var text = $(this.model.get("body"));
		var that = this;
		var i = 0;
		
		text.each(function(el){
			if ($(text[el]).is("p")){
		    var commentView = new Topaz.Views.CommentsShow({
		      article: that.model,
					paragraph: $(text[el]),
					id: i
		    });
				
				that.$el.append(commentView.render().$el)
				i++;
			}
		});
	}
});