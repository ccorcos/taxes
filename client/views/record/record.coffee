Template.record.events
  'click .back': (e,t) ->
    Router.go "home"
  'click .edit': (e,t) ->
    Router.go "editRecord", _id:@_id