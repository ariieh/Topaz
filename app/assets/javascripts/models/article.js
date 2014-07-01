Topaz.Models.Article = Backbone.Model.extend({
	urlRoot: "/api/articles",
	parse: function(response){
		if (response.comments){
			this.comments().set(response.comments);
			delete response.comments;
		}
		return response;
	},
	comments: function(){
		if (!this._comments){
			this._comments = new Topaz.Collections.Comments({
				article: this
			});
		}
		return this._comments;
	}
});