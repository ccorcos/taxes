confirmDelete = new ReactiveVar(false)
loadingDelete = new ReactiveVar(false)

Template.settings.created = ->
  loadingDelete.set(false)
  confirmDelete.set(false)

Template.settings.helpers
  loadingDelete: () -> loadingDelete.get()
  confirmDelete: () -> confirmDelete.get()

Template.settings.events
  'click .export': (e,t) ->
    if Meteor.isCordova
      alert('Please do this from a Desktop computer. Go to https://tax-writeoffs.meteor.com')
    else
      Router.go 'zip'
  'click .logout': (e,t) ->
    Meteor.logout()
  'click .delete-data': (e,t) ->
    confirmDelete.set(true)
  'click .confirm': (e,t) ->
    loadingDelete.set(true)
    Meteor.call 'deleteData', (err) ->
      loadingDelete.set(false)
      if err
        error err
      else
        Router.go 'home'
  'click .back': (e,t) ->
    Router.go "home"
