Template.signup.rendered = ->
  noError()

Template.signup.events
  'submit form#signup': formSubmit (e, t, values) ->
   
    # Trim and validate
    email = _.str.trim values.email
    password = values.password
    verify = values.verify

    unless validEmail(email)
      error("Invalid email address.")
      return

    if password != verify
      error "Passwords do not match."
      return

    if password.length <= 3
      error "Password must have more than 4 characters."
      return

    Accounts.createUser
      username: email
      email: email
      password: password
    ,
      (err) ->
        if err
          error(err.reason)
        else
          noError()
          afterSignup()