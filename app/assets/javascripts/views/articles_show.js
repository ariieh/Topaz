Topaz.Views.ArticlesShow = Backbone.View.extend({
	initialize: function(options){
		this.$contentEl = options.$contentEl;
		this.$sidebarEl = options.$sidebarEl;
	},
	template: JST["articles/show"],
	render: function(){
		var that = this;
    var user = new Topaz.Models.User({ id: this.model.get("author_id") });
    user.fetch({ success: function () { 
			var renderedContent = that.template({
				article: that.model,
				user: user
			});
			that.$contentEl.html(renderedContent);
			return that;
		}
		});
	}
});