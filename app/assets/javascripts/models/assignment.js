LLU.Models.Assignment = Backbone.Model.extend({
  parse: function(response) {
    return {
      id: response.id,
      klass_id: response.klass_id,
      name: response.name
    }
  }
});
