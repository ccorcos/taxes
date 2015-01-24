Template.signup.created = ->
  noError()
  @loading = new ReactiveVar(false)

Template.signup.helpers
  loading: () -> Template.instance().loading.get()


Template.signup.events
  'submit form#signup': formSubmit (e, t, values) ->
   
    # Trim and validate
    email = _.str.trim values.email
    password = values.password

    t.loading.set(true)
    Accounts.createUser
      email: email
      password: password
    ,
      (err) ->
        t.loading.set(false)
        if err
          error(err.reason)
        else
          noError()
          afterSignup()

  'click .exitSignup': (e,t) ->
    Router.go 'landing'
