Topaz.Views.ArticlesSnippet = Backbone.View.extend({
	initialize: function(){
		this.listenTo(this.model,"change",this.render);
	},
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
		this.listenTo(this.collection,"sync add remove",this.render);
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