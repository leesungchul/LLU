LLU.Models.Klass = Backbone.Model.extend({
  parse: function(response){
    LLU.assignments.add(response.assignments, {parse: true})
    return {
      name: response.name,
      id: response.id,
      assignments: response.assignments
    }
  }
});
