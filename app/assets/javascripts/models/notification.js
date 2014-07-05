Topaz.Models.Notification = Backbone.Model.extend({
	urlRoot: "/api/notifications",
	linkUrl: function(){
		switch(this.get("notification_type")){
		case 1:
			return "/#welcome";
			break;
		case 2:
			return "/#articles/" + this.get("article_id");
			break;
		case 3:
			return "/#articles/" + this.get("article_id");
			break;
		}
	}
});