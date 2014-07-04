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
		this.listenTo(this.collection, "sync remove", this.render);
		this.listenTo(this.collection, "add", this.add);
		this.subviews = [];
		this.key = options.key;
		this.name = options.name;
	},
	tagName: "ul",
	template: JST["articles/index"],
	render: function(){
		var renderedContent = this.template({
			articles: this.collection
		});
		this.addSubviews();
    this.listenForScroll();
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
	
  listenForScroll: function () {
    $("section.page").off("scroll");
    $("section.page").on("scroll", _.throttle(this.infiniteScroll.bind(this), 200));
  },

  infiniteScroll: function () {
    var articles = Topaz.Collections.articles;
    var that = this;
		var page = $("section.page");
		
    if(page[0].scrollHeight - page.scrollTop() <= page.outerHeight()){
      if (that.collection.page_number < that.collection.total_pages) {
        that.collection.fetch({
					// no infinite scroll on user show page
          data: { page: that.collection.page_number + 1, key: that.key, name: that.name },
          remove: false,
          wait: true
        });
      }	
    }
  },
	
	add: function(article){
    var snippetView = new Topaz.Views.ArticlesSnippet({
      model: article
    });
		this.subviews.push(snippetView);
		this.$el.append(snippetView.render().$el);
	}
});