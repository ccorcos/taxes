receiptStore = new FS.Store.GridFS("receiptStore");

@Receipts = new FS.Collection "recipts",
  stores: [receiptStore]
  filter: 
    allow: 
      contentTypes: ['image/*']

# has to be your image to maniuplate, and you must be logged in to see images.
Receipts.allow
  insert: (userId, doc) ->
    return true
  update: ->
    return true
  remove: (userId, doc) ->
    Records.findOne({ownerId:userId, receiptId: doc._id})?
  download: (userId, doc) ->
    Records.findOne({ownerId:userId, receiptId: doc._id})?

# when collectionhooks work for collectionfs
Receipts.files.before.insert (userId, doc) ->
  doc.metadata = {ownerId: userId}
  return doc

@Records = new Mongo.Collection("records")

Records.helpers
  receipt: () ->
    Receipts.findOne(@receiptId)