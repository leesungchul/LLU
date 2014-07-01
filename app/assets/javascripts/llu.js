window.LLU = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    LLU.students = new LLU.Collections.Students();
    LLU.assignments = new LLU.Collections.Assignments();
    LLU.current_user = new LLU.Models.CurrentUser();
    LLU.current_user.fetch({
      success: function() {
        LLU.students.add(LLU.current_user);
        LLU.klasses = new LLU.Collections.Klasses();
        LLU.klasses.fetch({
          success: function() {
            new LLU.Routers.Students({$main: $('#main')});
            Backbone.history.start();
          }
        });
      }
    });
  }
};
