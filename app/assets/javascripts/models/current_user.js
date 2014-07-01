LLU.Models.CurrentUser = Backbone.Model.extend({
  url: '/users/current',
  parse: function(response) {
    LLU.my_klasses = new LLU.Collections.Klasses(response.klasses, {parse: true});
    LLU.student_assignments = new LLU.Collections.StudentAssignments(response.student_assignments, {parse:true});
    return {
      user_name: response.user_name,
      email: response.email,
      id: response.id,
      klasses: LLU.my_klasses,
      assignments: LLU.student_assignments
    }
  }
});