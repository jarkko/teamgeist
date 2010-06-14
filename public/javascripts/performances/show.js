PerformanceForm = Behavior.create({
  initialize : function() {
    this._startObserving();
    this.updating = false;
    this.mapUpload = new AjaxUpload('upload_button', {action: "/maps"});
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
      var baseUrl = '/performances/' + perfId;
      this.element.action = this.element.action + '/' + perfId;
      this.element.down('div').insert($input({type: 'hidden', value: 'put', name: '_method'}));
      
      $('new_mistake').action = baseUrl + '/mistakes';
      
      this.mapUpload.setAction(baseUrl + '/maps')
      
      this.updating = true;
    }
    
    $('spinner').fade();
  }
});

MistakeForm = Behavior.create(Remote.Form, {
  initialize : function($super) {
    $super({
      onSuccess : this._onSuccess
    })
  },
  _onSuccess : function(response) {
    $('mistakes_head').show();
    $('no_mistakes_row').hide();
    $('mistake_description').clear();
  }
})

Event.addBehavior({
  '#edit_performance' : PerformanceForm,
  '#new_mistake' : MistakeForm
});