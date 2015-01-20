
Meteor.publishComposite 'records', () ->
  if @userId
    return {
      find: ->
        r = Records.find {ownerId: @userId}
        if r then return r else return false
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