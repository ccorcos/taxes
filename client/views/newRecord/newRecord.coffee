Template.newRecord.rendered = ->
  noError()

Template.newRecord.events
  'submit form#record': formSubmit (e, t, values) ->

    note = _.str.trim values.note
    amount = values.amount.toNumber()
    file = values.receipt[0]

    if note?.length is 0
      error "You need a note."
      return

    unless amount
      error "Enter a decimal amount"
      return

    unless file
      error "Attach a receipt!"
      return

    Receipts.insert file, (err, fileObj) ->
      if err
        console.log err
        error err.reason
      else
        Meteor.call 'newRecord', note, amount, fileObj._id
        
  'click .cancel': (e,t) ->
    Router.go 'home'