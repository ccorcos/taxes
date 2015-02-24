loading = new ReactiveVar(false)
Template.login.created = ->
  noError()
  loading.set(false)

Template.login.helpers
  loading: () -> 
    loading.get()

Template.login.events
  'submit form#login' : formSubmit (e, t, values) ->

    unless disconnected()
      # Trim and validate
      email = _.str.trim values.email
      password = values.password

      loading.set(true)
      Meteor.loginWithPassword email, password,
        (err) ->
          loading.set(false)
          if err
            error(err.reason)
          else
            noError()
            afterLogin()

  'click .toForgot': (e,t) ->
    Router.go 'forgot'

  'click .exitLogin': (e,t) ->
    Router.go 'landing'
