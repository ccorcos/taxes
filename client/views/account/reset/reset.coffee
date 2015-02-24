loading = new ReactiveVar(false)

Template.reset.created = ->
  noError()
  noMessage()
  loading.set(false)

Template.reset.helpers
  loading: () -> loading.get()


Template.reset.events
  'click .exitReset': () ->
    Router.go 'landing'

  'submit form#reset': formSubmit (e, t, values) ->
    
    unless disconnected()
      password = values.password
      verify = values.verify

      if password != verify
        error "Passwords do not match."
        return

      if password.length <= 3
        error "Password must have more than 4 characters."
        return

      message "Resetting your password..."

      loading.set(true)
      Accounts.resetPassword Session.get('resetPasswordToken'), password,
        (err) ->
          loading.set(false)
          if err
            noMessage()
            error(err.reason)
          else
            Session.set('resetPasswordToken', null)
            noMessage()
            noError()
            afterLogin()


