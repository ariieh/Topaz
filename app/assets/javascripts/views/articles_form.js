Topaz.Views.ArticlesForm = Backbone.View.extend({
	template: JST["articles/form"],
	initialize: function(options){
		this.$contentEl = options.$contentEl;
		this.$sidebarEl = options.$sidebarEl;
	},
	events: {
		"submit": "submit"
	},
	render: function(){
		var renderedContent = this.template({
			article: this.model
		});
		this.$contentEl.html(renderedContent);
		return this;
	},
	submit: function(event){
		alert("hi");
		event.preventDefault();
		
		var formData = $(event.currentTarget).serializeJSON();
		// $("file").files
		// this.handle_files();
		console.log(formData);
    var newArticle = new Topaz.Models.Article(formData["article"]);
		
    newArticle.save({
    	// handle files here
    }, {
      success: function () {
        Topaz.Collections.articles.add(newArticle);
      }
    });
		
	},
	handle_files: function(files, callback) {
	  var file = files[0];
	  var reader = new FileReader();
	  reader.onload = function(e) {
	  	callback(e.target.result);
	  }
	  reader.readAsDataURL(file);
	}
});