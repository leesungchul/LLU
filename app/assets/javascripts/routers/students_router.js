LLU.Routers.Students = Backbone.Router.extend({
  initialize: function(options) {
    this.$main = options.$main;
  },

  routes: {
    "": "root",
    "my_classes": "myClasses",
    "classes": "classesIndex",
    "classes/:id": "showClass",
    "assignments/:id": "showAssignment"
  },

  root: function() {
    this.myClasses();
  },

  myClasses: function() {
    var myClassesView = new LLU.Views.MyClassesPage({
      collection: LLU.my_klasses
    });
    this._swapMainView(myClassesView);
  },

  classesIndex: function() {
    var classesIndexView = new LLU.Views.ClassesIndexPage({
      collection: LLU.klasses
    });
    this._swapMainView(classesIndexView)
  },

  showClass: function(id) {
    var that = this;
    this._getClass(id, function(klass) {
      var showClassView = new LLU.Views.ClassShowPage({
        model: klass,
        collection: LLU.student_assignments
      });
      that._swapMainView(showClassView);
    });
  },

  showAssignment: function(id) {
    var showAssignmentView = new LLU.Views.AssignmentShowPage({
      model: LLU.assignments.get(id),
      collection: LLU.student_assignments
    });
    this._swapMainView(showAssignmentView)
  },

  _getClass: function(id, callback){
    var that = this;
    var klass = LLU.my_klasses.get(id);
    if (!klass) {
      klass = new LLU.Models.Klass({ id: id });
      klass.collection = LLU.my_klasses;
      klass.fetch({
        success: function() {
          LLU.my_klasses.add(klass);
          callback(klass);
        }
      });
    } else {
      callback(klass)
    }
  },

  _swapMainView: function(view) {
    this.$main._currentView && this.$main._currentView.remove();
    this.$main._currentView = view;
    this.$main.html(view.render().$el);
  }
});
