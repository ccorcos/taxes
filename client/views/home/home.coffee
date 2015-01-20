Template.home.helpers
  records: () -> Records.find({}, {sort: {date: -1}})
  formatNote: () ->
    if @note.length > 20
      return @note[0...17] + '...'
    else 
      return @note

Template.home.events
  'click .newRecord': (e,t) ->
    Router.go 'newRecord'
  'click .record-item': (e,t) ->
    Router.go 'record', {_id: @_id}
  'click .logout': (e,t) ->
    Meteor.logout()
  'click .export': (e,t) ->
    Router.go 'zip'