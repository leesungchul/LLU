LLU.Views.ClassShowPage = Backbone.View.extend({
  template: JST['klasses/show_class'],

  render: function() {
    var that = this;
    assignments = this.model.get('assignments')
    var renderedContent = this.template({
      klass: that.model,
      assignments: that.model.get('assignments'),
      status: LLU.student_assignments
    });
    this.$el.html(renderedContent);
    return this;
  }
})