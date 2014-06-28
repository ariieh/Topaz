Topaz.Views.ArticlesSnippet = Backbone.View.extend({
  template: JST["articles/snippet"],
  tagName: "li",

  render: function () {
    var renderedContent = this.template({ article: this.model });
    this.$el.html(renderedContent);
    return this;
  }
});

Topaz.Views.ArticlesIndex = Backbone.View.extend({
	template: JST["articles/index"],
	render: function(){
		var renderedContent = this.template({
			articles: this.collection
		});
		this.$el.html(renderedContent);
		this.addSubviews();
		return this;
	},
	addSubviews: function(){
		this.collection.forEach(function(article){
			
		});
	}
});