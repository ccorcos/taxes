loading = new ReactiveVar(false)

Template.signup.created = ->
  noError()
  loading.set(false)

Template.signup.helpers
  loading: () -> loading.get()


Template.signup.events
  'submit form#signup': formSubmit (e, t, values) ->
   
    unless disconnected()
      # Trim and validate
      email = _.str.trim values.email
      password = values.password

      loading.set(true)
      Accounts.createUser
        email: email
        password: password
      ,
        (err) ->
          loading.set(false)
          if err
            error(err.reason)
          else
            noError()
            afterSignup()

  'click .exitSignup': (e,t) ->
    Router.go 'landing'
