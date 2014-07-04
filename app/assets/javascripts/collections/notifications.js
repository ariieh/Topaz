Topaz.Collections.Notifications = Backbone.Collection.extend({
	model: Topaz.Models.Notification,
	url: "/api/notifications",
	comparator: function(model){
		return model.get("read");
	}
});