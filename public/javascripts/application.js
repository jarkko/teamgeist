// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function getAuthenticityToken() {
  var token = $$('meta[name=authenticity_token]')[0].readAttribute('value');
  console.log("reading token " + token);
  return token;
}

Event.addBehavior({
  '#flash:click' : function(e) {
    this.fade();
  },
  '.destroy_performance' : Remote.Link(
                            {method: 'delete', 
                             parameters : {authenticity_token : getAuthenticityToken()},
                             onSuccess : function(response) {
                               Effect.Puff(this.element.up('li'), {duration: 0.3});
                             }})
});