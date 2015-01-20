Template.settings.events
  'click .export': (e,t) ->
    Router.go 'zip'
  'click .logout': (e,t) ->
    Meteor.logout()
  'click .delete-data': (e,t) ->
    Meteor.call 'deleteData', (err) ->
      if err
        console.log err
      else
        Router.go 'home'
  'click .back': (e,t) ->
    Router.go "home"