Template.signup.rendered = ->
  noError()

Template.signup.events
  'submit form#signup': formSubmit (e, t, values) ->
   
    # Trim and validate
    email = _.str.trim values.email
    password = values.password

    Accounts.createUser
      email: email
      password: password
    ,
      (err) ->
        if err
          error(err.reason)
        else
          noError()
          afterSignup()

  'click .exitSignup': (e,t) ->
    Router.go 'landing'
