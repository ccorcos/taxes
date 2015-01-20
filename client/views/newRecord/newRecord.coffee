Template.newRecord.rendered = ->
  noError()

Template.newRecord.helpers
  categories: () -> categories

Template.newRecord.events
  'submit form#record': formSubmit (e, t, values) ->

    note = _.str.trim values.note
    amount = values.amount.toNumber()
    category = values.category
    file = values.receipt[0]

    if note?.length is 0
      error "You need a note."
      return

    unless amount
      error "Enter a decimal amount"
      return

    unless category
      error "Select a category."
      return

    unless file
      error "Attach a receipt!"
      return

    Receipts.insert file, (err, fileObj) ->
      if err
        console.log err
        error err.reason
      else
        Meteor.call 'newRecord', note, amount, category, fileObj._id, (err) ->
          if err
            console.log err
            error err.reason
          else
            Router.go 'home'
        
  'click .cancel': (e,t) ->
    Router.go 'home'


