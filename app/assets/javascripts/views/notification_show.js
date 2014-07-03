Topaz.Views.NotificationShow = Backbone.View.extend({
	initialize: function(options){
		this.listenTo(window.currentUser, "sync", this.render)
	},
	events: {
		"click a": "click"
	},
	template: JST["notifications/show"],
	render: function(){
		var renderedContent = this.template({
			currentUser: window.currentUser
		});
		this.$el.html(renderedContent);
		return this;
	},
	click: function(event){
		var notification = currentUser.notifications().where({id: parseInt($(event.currentTarget).attr("id"))})[0];
		notification.save({read: true});
		this.render();
	}
});