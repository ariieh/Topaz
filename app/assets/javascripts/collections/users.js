Topaz.Collections.Users = Backbone.Collection.extend({
	model: Topaz.Models.User,
	url: "/api/users",
  getOrFetch: function (id) {
    var users = this;
    var user;
    if (user = this.get(id)) {
      user.fetch();
    } else {
      user = new Topaz.Models.User({ id: id });
      user.fetch({ success: function () 
				{ users.add(user); }
			});
    }

    return user;
  }
});