Topaz.Collections.Tags = Backbone.Collection.extend({
	model: Topaz.Models.Tag,
	url: "/api/tags",
  getOrFetch: function (id) {
    var tags = this;
    var tag;
    if (tag = this.get(id)) {
      tag.fetch();
    } else {
      tag = new Topaz.Models.Tag({ id: id });
      tag.fetch({ success: function () 
				{ console.log(tag);
					tags.add(tag); }
			});
    }

    return tag;
  }
});