PerformanceForm = Behavior.create({
  initialize : function() {
    this._startObserving();
  },
  _startObserving : function() {
    new Form.Observer(this.element, 1, function(form, value){
      $('spinner').show();      
      new Ajax.Request(form.action, 
                       {parameters : form.serialize(),
                        onSuccess : function() {
                          $('spinner').hide()}
                        });
    });
  }
});

Event.addBehavior({
  '#edit_performance' : PerformanceForm
});