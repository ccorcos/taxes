
Template.login.created = ->
  noError()
  @loading = new ReactiveVar(false)

Template.login.helpers
  loading: () -> Template.instance().loading.get()

Template.login.events
  'submit form#login' : formSubmit (e, t, values) ->

    # Trim and validate
    email = _.str.trim values.email
    password = values.password

    t.loading.set(true)
    Meteor.loginWithPassword email, password,
      (err) ->
        t.loading.set(false)
        if err
          error(err.reason)
        else
          noError()
          afterLogin()

  'click .toForgot': (e,t) ->
    Router.go 'forgot'

  'click .exitLogin': (e,t) ->
    Router.go 'landing'
