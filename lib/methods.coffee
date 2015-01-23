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
  updateRecord: (_id, note, amount, category) ->
    check note, String
    check amount, Number
    check _id, String
    check category, String
    if @userId
      Records.update
          ownerId: @userId
          _id: _id
        ,
          $set:
            note: note
            amount: amount
            category: category

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

