Topaz.Collections.Users = Backbone.Collection.extend({
	model: Topaz.Models.User,
	url: "/api/users",
  getOrFetch: function (id, callback) {
    var users = this;
    var user;
    if (user = this.get(id)) {
      user.fetch({
      	success: callback
      });
    } else {			
      user = new Topaz.Models.User({ id: id });
      user.fetch({ success: function () 
				{ users.add(user);
					typeof callback === 'function' && callback();}
			});
    }

    return user;
  }
});