Template.record.events
  'click .back': (e,t) ->
    Router.go "home"
  'click .delete': (e,t) ->
    if confirm("Are you sure you want to delete this record?")
      Meteor.call 'deleteRecord', @_id, (err) ->
        if err
          console.log err
        else
          Router.go "home"