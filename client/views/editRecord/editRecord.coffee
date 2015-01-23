Template.editRecord.events
  'click .cancel': (e,t) ->
    Router.go "record", _id:@_id
  'click .save': (e,t) ->
    note = _.str.trim t.find('input[name=note]').value
    amount = t.find('input[name=amount]').value?.toNumber()
    category = t.find('select[name=category]').value

    if note?.length is 0
      error "You need a note."
      return

    unless amount
      error "Enter a decimal amount"
      return

    unless category
      error "Select a category."
      return

    recordId = @_id

    Meteor.call 'updateRecord', recordId, note, amount, category, (err) ->
      if err
        console.log err
        error err.reason
      else
        Router.go 'record', _id:recordId

  'click .delete': (e,t) ->
    if confirm("Are you sure you want to delete this record?")
      Meteor.call 'deleteRecord', @_id, (err) ->
        if err
          console.log err
        else
          Router.go "home"


Template.editRecord.helpers
  categories: () -> categories
  selected: (a, b) -> 
    if a is b then "selected"