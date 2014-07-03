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
	},
	time: function(){
		var time = this.get("created_at");
		var date = time.slice(0,10);
		var hours = parseInt(time.slice(11,13));
		var minutes = time.slice(14,16);
		var ampm = hours > 11 ? "pm" : "am";
		return date + " at " + (((hours + 11) % 12) + 1) + ":" + minutes + ampm;
	}
});