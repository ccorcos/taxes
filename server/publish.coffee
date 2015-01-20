
Meteor.publishComposite 'records', () ->
  if @userId
    return {
      find: ->
        Records.find {ownerId: @userId}
      children: [{
        find: (record) ->
          if record?.receiptId?
            Receipts.find record.receiptId
        }]}

Meteor.publishComposite 'record', (id) ->
  if @userId
    return {
      find: ->
        Records.find {ownerId: @userId, _id:id}
      children: [{
        find: (record) ->
          if record?.receiptId?
            Receipts.find record.receiptId
        }]}