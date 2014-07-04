Topaz.Collections.Articles = Backbone.Collection.extend({
	initialize: function(){
    this.sortKey = 'created_at';
	},
	model: Topaz.Models.Article,
	url: "/api/articles",
	parse: function(response){
    this.page_number = parseInt(response.page_number);
    this.total_pages = parseInt(response.total_pages);
    return response.articles;
	},
  getOrFetch: function (id, callback) {
    var articles = this;
    var article;
    if (article = this.get(id)) {
      article.fetch({
      	success: callback
      });
    } else {
      article = new Topaz.Models.Article({ id: id });
      article.fetch({
				success: function () {
					callback();
				},
				error: function(data){
					console.log(data);
				}
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
		if (key === "user" || key === "tag"){
			this.sortKey = "created_at";
		} else {
			this.sortKey = key;
		}
		this.sort();
	}
});