Topaz.Collections.Articles = Backbone.Collection.extend({
	model: Topaz.Models.Article,
	url: "/api/articles"
});

Topaz.Collections.articles = new Topaz.Collections.Articles();