Meteor.methods
  newRecord: (note, amount, receiptId) ->
    check note, String
    check amount, Number
    check receiptId, String
    if @userId
      Records.insert
        ownerId: @userId
        date: Date.now()
        note: note
        amount: amount
        receiptId: receiptId
  deleteRecord: (id) ->
    check id, String
    if @userId
      Records.remove {_id: id, ownerId: @userId}