Topaz.Collections.Articles = Backbone.Collection.extend({
	model: Topaz.Models.Article,
	url: "/api/articles",
  getOrFetch: function (id) {
    var articles = this;
    var article;
    if (article = this.get(id)) {
      article.fetch();
    } else {
      article = new Topaz.Models.Article({ id: id });
      article.fetch({ success: function () 
				{ articles.add(article); }
			});
    }

    return article;
  }
});

Topaz.Collections.articles = new Topaz.Collections.Articles();