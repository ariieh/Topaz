Topaz.Views.ArticlesForm = Backbone.View.extend({
	template: JST["articles/form"],
	initialize: function(options){
		// Topaz.Collections.articles.bind('remove', this.redirectToUsersShow, this);
	},
	events: {
		"submit form": "submit",
		"change input[type='file']": "handleFiles",
		"keyup input[name='article[title]']": "handleTitle",
		"keyup #text-editor": "handleBody",
		"click .text-control i": "handleBody"
	},
	render: function(){
		var renderedContent = this.template({
			article: this.model
		});
		this.$el.html(renderedContent);
		return this;
	},
	submit: function(event){
		Topaz.pageLoaderShow();
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
				Backbone.history.navigate("users/" + window.currentUserId, {trigger: true});
				// Topaz.pageLoaderHide();
      },
			error: function(model, response){
				Topaz.flashFormErrors($.parseJSON(response.responseText));
      },
			wait: true
    });
	},
	handleFiles: function(event) {
	  var that = this;
		var files = event.currentTarget.files;
		var file = files[0];
	  var reader = new FileReader();
	  reader.onload = function(e) {
	  	that.photo = e.target.result;
	    $("#image-preview").attr("src", that.photo);
	    $("#image-preview").show();
	  }
	  reader.readAsDataURL(file);
	},
	handleTitle: function(event){
		$("input[name='article[title]']").removeClass("error");
		$('#title-preview').css({"display": "inline-block"})
		$('#title-preview').html($(event.currentTarget).val());
		
		if ($(event.currentTarget).val().length === 0){
			$('#title-preview').css({"display": "none"})
		}
	},
	handleBody: function(event){
		$("textarea[name='article[body]']").removeClass("error");
		$('#body-preview').css({"display": "inline-block"});
		
		var $form = $("#article-form");
		var formData = $form.serializeJSON();
		
		$.ajax({
			url: "/api/articles/htmlbody",
			data: formData.article,
			success: function(html){
				$('#body-preview').html(html);
			}
		});
				
		if ($("#text-editor").val().length === 0){
			$('#body-preview').css({"display": "none"})
		}
	},
	redirectToUsersShow: function(){
		Backbone.history.navigate("users/" + window.currentUserId, {trigger: true});
	}
	
});