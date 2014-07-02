Topaz.Views.ArticlesForm = Backbone.View.extend({
	template: JST["articles/form"],
	initialize: function(options){
	},
	events: {
		"submit form": "submit",
		"change input[type='file']": "handleFiles"
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
		var $form = $(event.currentTarget);
		var formData = $form.serializeJSON();
    var newArticle = new Topaz.Models.Article(formData["article"]);

    newArticle.save({ photo: this.photo
    }, {
      success: function () {
        Topaz.Collections.articles.add(newArticle);
				Backbone.history.navigate("/articles/" + newArticle.get("id"), {trigger: true});
      }
    });
		
	},
	handleFiles: function(event) {
	  var that = this;
		var files = event.currentTarget.files;
		var file = files[0];
	  var reader = new FileReader();
	  reader.onload = function(e) {
	  	that.photo = e.target.result;
	  }
	  reader.readAsDataURL(file);
	}
});