PerformanceForm = Behavior.create({
  initialize : function() {
    this._startObserving();
    this.updating = false;
  },
  _startObserving : function() {
    new Form.Observer(this.element, 1, this._onObserve.bind(this));
  },
  _onObserve : function(form, value) {
    $('spinner').show();
    $('spinner').appear({duration: 1});      
    new Ajax.Request(form.action, 
                     {parameters : form.serialize(),
                      onSuccess : this._onSuccess.bind(this),
                      });
  },
  _onSuccess : function(response) {
    if (!this.updating) {
      var perfId = response.responseText;
      this.element.action = this.element.action + '/' + perfId;
      this.element.down('div').insert($input({type: 'hidden', value: 'put', name: '_method'}));
      this.updating = true;
    }
    
    $('spinner').fade();
  }
});

Event.addBehavior({
  '#edit_performance' : PerformanceForm
});