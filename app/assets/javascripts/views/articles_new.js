Topaz.Views.ArticlesNew = Backbone.View.extend({
	template: JST["articles/new"],
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
		var formData = $(event.currentTarget).serializeJSON();
    var newArticle = new Topaz.Models.Article(formData["article"]);

    newArticle.save({}, {
      success: function () {
        Topaz.Collections.articles.add(newArticle);
      }
    });
		
	}
});