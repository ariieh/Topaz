Topaz.Models.User = Backbone.Model.extend({
	urlRoot: "/api/users",
	parse: function(response){
		if (response.notifications){
			this.notifications().set(response.notifications);
			delete response.notifications;
		}
		return response;
	},
	notifications: function(){
		if (!this._notifications){
			this._notifications = new Topaz.Collections.Notifications({
				user: this
			});
		}
		return this._notifications;
	}
});