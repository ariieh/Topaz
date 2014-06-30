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
	initialize: function(options){
	},
	tagName: "ul",
	template: JST["articles/index"],
	render: function(){
		var renderedContent = this.template({
			articles: this.collection
		});		

		this.addSubviews();
		return this;
	},
	addSubviews: function(){
		this.$el.empty();
		this.collection.each(function(article){
	    var snippetView = new Topaz.Views.ArticlesSnippet({
	      model: article
	    });
			this.$el.append(snippetView.render().$el);
		}, this);
	}
});