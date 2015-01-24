Session.setDefault 'imageData', null

Template.newRecord.rendered = ->
  noError()
  Session.set 'imageData', null

Template.newRecord.helpers
  categories: () -> categories

Template.newRecord.events
  'click .takePicture': (e,t) ->
    cameraSuccess = (imageData) ->
      Session.set('imageData', "data:image/jpeg;base64," + imageData)
    cameraError = (message) ->
      Meteor.defer ->
        alert message

    navigator.camera.getPicture cameraSuccess, cameraError, 
      quality: 50
      destinationType: Camera.DestinationType.DATA_URL

  'submit form#record': formSubmit (e, t, values) ->

    note = _.str.trim values.note
    amount = values.amount.toNumber()
    category = values.category

    if note?.length is 0
      error "You need a note."
      return

    unless amount
      error "Enter a decimal amount"
      return

    unless category
      error "Select a category."
      return


    insert = (data) ->
      Receipts.insert data, (err, fileObj) ->
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

    if Meteor.isCordova
      data = Session.get 'imageData'
      unless data
        error "Snap a picture of a receipt!"
        return
        
      insert(data)

    else
      file = values.receipt[0]

      unless file
        error "Attach a receipt!"
        return

      processImage file, 500, 500, (data) ->
        insert(data)
        
  'click .cancel': (e,t) ->
    Router.go 'home'



