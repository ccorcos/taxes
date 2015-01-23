
Meteor.publishComposite 'records', () ->
    find: ->
      if @userId
        Records.find {ownerId: @userId}
    children: [{
      find: (record) ->
        if record?.receiptId?
          Receipts.find record.receiptId
      }]

Meteor.publishComposite 'record', (_id) ->
    find: ->
      if @userId
        Records.find {ownerId: @userId, _id:_id}
    children: [{
      find: (record) ->
        if record?.receiptId?
          Receipts.find record.receiptId
      }]
