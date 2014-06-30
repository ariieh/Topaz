Topaz.Views.ArticlesForm = Backbone.View.extend({
	template: JST["articles/form"],
	initialize: function(options){
	},
	events: {
		"submit form": "submit"
	},
	render: function(){
		var renderedContent = this.template({
			article: this.model
		});
		this.$el.html(renderedContent);
		return this;
	},
	submit: function(event){
    event.preventDefault();
		
		var formData = $(event.currentTarget).serializeJSON();
    var newArticle = new Topaz.Models.Article(formData["article"]);

    newArticle.save({
    }, {
      success: function () {
        Topaz.Collections.articles.add(newArticle);
      }
    });
		
	}
	// handle_files: function(files, callback) {
	//   var file = files[0];
	//   var reader = new FileReader();
	//   reader.onload = function(e) {
	//   	callback(e.target.result);
	//   }
	//   reader.readAsDataURL(file);
	// }
});