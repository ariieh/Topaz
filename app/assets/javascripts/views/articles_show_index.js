Topaz.Views.ArticlesShowIndex = Backbone.View.extend({
	initialize: function(options){
		this.listenTo(this.collection, "sync remove", this.render);
		this.listenTo(this.collection, "add", this.add);
		this.subviews = [];
	},
  template: JST["articles/showindex"],
  render: function () {
    var renderedContent = this.template({ articles: this.collection });
		this.addSubviews();
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
	}
});