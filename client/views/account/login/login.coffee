Template.login.rendered = ->
  noError()

Template.login.events
  'submit form#login' : formSubmit (e, t, values) ->
   
    # Trim and validate
    email = _.str.trim values.email
    
    unless validEmail(email)
      error("Invalid email address.")
      return

    password = values.password

    Meteor.loginWithPassword email, password,
      (err) ->
        if err
          error(err.reason)
        else
          noError()
          afterLogin()