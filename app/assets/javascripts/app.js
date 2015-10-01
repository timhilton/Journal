console.log('scripts loaded');

var token = $('#api-token').val();
$.ajaxSetup({
  headers:{
    "token": token
  }
});

//Model

var Journal = Backbone.Model.extend({});

//collection

var JournalCollection = Backbone.Collection.extend({
  model: Journal,
  url: '/api/journals'
});

//Views
var JournalView = Backbone.View.extend({
  tagName: 'div',
  className: 'journal',
  template: _.template( $('#journal-template').html()),
  render: function(){
    this.$el.empty();
    var $html = $(this.template(this.model.toJSON()));
    this.$el.append($html);
  },
  events:{
    'click button.remove': 'removeJournal'
  },
  removeJournal: function(){
    this.model.destroy();
    this.$el.remove();
  }
});

var JournalListView = Backbone.View.extend({
  initialize: function(){
    this.listenTo(this.collection, 'add', this.render);
  },
  render: function(){
    this.$el.empty();
    var journals = this.collection.models;
    var view;
    for (var i = journals.length-1; i >= 0; i--) {
      view = new JournalView({model: journals[i]});
      view.render();
      this.$el.append(view.$el);
    }
  }
});

var journals = new JournalCollection();
var journalsPainter = new JournalListView({
  collection: journals,
  el: $('#journal-list')
});
journals.fetch();

$('form.journal-entry').on('submit', function(e){
  e.preventDefault();
  var entry = $(this).find("#my-journal").val();
  journals.create({entry: entry});
  $('#my-journal').val('');
});
