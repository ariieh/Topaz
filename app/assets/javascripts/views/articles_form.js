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

		this.model.set(formData["article"]);
		
		var that = this;
    this.model.save({ photo: this.photo }, {
      success: function () {
				if (Topaz.Collections.articles.where({id: that.model.get("id")}).length === 0){
	        Topaz.Collections.articles.add(that.model);
				}
				
				Backbone.history.navigate("/users/" + window.currentUserId, {trigger: true});
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