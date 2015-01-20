
Template.landing.events
  'click .toLogin': (e,t) ->
    Router.go 'login'
  'click .toSignup': (e,t) ->
    Router.go 'signup'