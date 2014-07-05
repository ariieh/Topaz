Topaz.Views.ArticlesShowIndex = Backbone.View.extend({
	initialize: function(options){
		this.listenTo(this.collection, "sync remove", this.render);
		this.listenTo(this.collection, "add", this.add);
		this.subviews = [];
		this.name = options.name;
		this.id = options.id;
		this.query = options.query;
	},
  template: JST["articles/showindex"],
  render: function () {
    var renderedContent = this.template({ articles: this.collection });
		this.addSubviews();
    this.listenForScroll();
    return this;
  },
	addSubviews: function(){
		this.subviews.forEach(function(subview){ subview.remove(); });
		
		this.$el.empty();
		
		this.collection.each(function(article){
	    var showView = new Topaz.Views.ArticlesShow({
	      model: article
	    });
			this.subviews.push(showView);
			this.$el.append(showView.render().$el);
		}, this);
	},
	add: function(article){
    var showView = new Topaz.Views.ArticlesShow({
      model: article
    });
		this.subviews.push(showView);
		this.$el.append(showView.render().$el);
		Topaz.scrollLoaderHide();
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
				Topaz.scrollLoaderShow();
	        that.collection.fetch({
	          data: {
							page: that.collection.page_number + 1,
							key: that.key,
							query: that.query,
							name: that.name,
							id: that.id
						},
	          remove: false,
	          wait: true
	        });
      }	
    }		
  }
});