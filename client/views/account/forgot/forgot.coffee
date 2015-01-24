Template.forgot.created = ->
  noError()
  noMessage()
  @loading = new ReactiveVar(false)

Template.forgot.helpers
  loading: () -> Template.instance().loading.get()


Template.forgot.events
  'submit form#recover': formSubmit (e, t, values) ->

    email = _.str.trim values.email

    unless email
      error 'Please provide an email address.'
      return

    message "Sending you an email..."

    t.loading.set(true)
    Accounts.forgotPassword
      email: email
    ,
      (err) ->
        t.loading.set(false)
        if err
          noMessage()
          error(err.reason)
        else
          noError()
          message "Check your email for a recovery link."

  'click .toLogin': (e,t) ->
    Router.go 'login'