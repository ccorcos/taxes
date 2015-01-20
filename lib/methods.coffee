Meteor.methods
  newRecord: (note, amount, category, receiptId) ->
    check note, String
    check amount, Number
    check receiptId, String
    check category, String
    if @userId
      Records.insert
        ownerId: @userId
        date: Date.now()
        note: note
        category: category
        amount: amount
        receiptId: receiptId
  deleteRecord: (id) ->
    check id, String
    if @userId
      Records.remove {_id: id, ownerId: @userId}

  deleteData: ->
    if @userId
      records = Records.find({ownerId: @userId}).fetch()
      for record in records
        Receipts.remove record.receiptId
        Records.remove record._id
