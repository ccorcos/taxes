@getReceiptData = (receiptId) ->

  something = Async.runSync (done) ->
    img = ''
    Receipts.findOne(receiptId).createReadStream().on 'data', (data) ->
        img += data.toString('base64')
      .on 'end', () -> 
        done(null, img)
  return something.result
