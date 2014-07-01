LLU.Views.MyClassesPage = Backbone.View.extend({
  template: JST['klasses/my_classes'],

  initialize: function(options) {
    this.collection = options.collection;
  },

  render: function() {
    var that = this;
    var content = this.template({
      my_classes: this.collection
    });
    this.$el.html(content);
    return this;
  }
});