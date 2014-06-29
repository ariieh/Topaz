Topaz.Collections.Articles = Backbone.Collection.extend({
	initialize: function(){
    this.sortKey = 'created_at';
	},
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
  },
	comparator: function(a,b){
    a = a.get(this.sortKey);
    b = b.get(this.sortKey);
    return a > b ? -1 : a < b ? 1 : 0;
	},
	sortByKey: function(key){
		this.sortKey = key;
		this.sort();
	}
});