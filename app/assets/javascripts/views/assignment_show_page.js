LLU.Views.AssignmentShowPage = Backbone.View.extend({
  template: JST['assignments/show_assignment'],

  initialize: function() {
    this.collection = LLU.student_assignments;
    this.listenTo(this.collection,"change:status", this.render);
  },

  events: {
    'click #submit-assignment': 'submit'
  },

  render: function() {
    var that = this;
    /*
      assignment questions would be locked if status closed
    */
    var renderedContent = this.template({
      assignment: that.model,
      status: that.collection.findWhere({assignment_id: that.model.get('id')})
    });
    this.$el.html(renderedContent);
    return this;
  },

  submit: function(event){
    var that = this;
    var sa = this.collection.findWhere({assignment_id: that.model.get('id')})
    event.preventDefault();
    $.ajax({
      type: 'put',
      url: '/student_assignments/' + sa.get('id'),
      data: JSON.stringify({student_assignment: {status: 'Closed', assignment_id: this.model.get('id')}}),
      contentType: 'application/json',
      dataType: 'json',
      success: function(response) {
        sa.set({status: "Closed"});
      }
    })
  }

})