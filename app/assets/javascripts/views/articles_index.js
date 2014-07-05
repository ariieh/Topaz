Topaz.Views.ArticlesSnippet = Backbone.View.extend({
	initialize: function(){
		this.listenTo(this.model, "change", this.render);
	},
	events: {
		"submit .delete-form": "destroy"
	},
  template: JST["articles/snippet"],
  tagName: "li",
  render: function () {
    var renderedContent = this.template({ article: this.model });
    this.$el.html(renderedContent);
    return this;
  },
	destroy: function(){
		event.preventDefault();
		this.model.destroy();
	}
});

Topaz.Views.ArticlesIndex = Backbone.View.extend({
	initialize: function(options){
		if (this.key = options.key) this.collection.sortByKey(this.key);
		this.listenTo(this.collection, "sync remove", this.render);
		this.listenTo(this.collection, "add", this.add);
		this.subviews = [];
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
		this.subviews.forEach(function(subview){ subview.remove(); });
		
		this.$el.empty();
		
		this.collection.each(function(article){
	    var snippetView = new Topaz.Views.ArticlesSnippet({
	      model: article
	    });
			this.subviews.push(snippetView);
			this.$el.append(snippetView.render().$el);
		}, this);
	},
	
	add: function(article){
    var snippetView = new Topaz.Views.ArticlesSnippet({
      model: article
    });
		this.subviews.push(snippetView);
		this.$el.append(snippetView.render().$el);
	}
});