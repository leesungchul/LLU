LLU.Models.StudentAssignment = Backbone.Model.extend({
  parse: function(response) {
    return {
      id: response.id,
      student_id: response.student_id,
      assignment_id: response.assignment_id,
      status: response.status
    }
  }
});
