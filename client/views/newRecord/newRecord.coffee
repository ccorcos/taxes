
Template.newRecord.created = ->
  noError()
  @loading = new ReactiveVar(false)
  @imageData = new ReactiveVar(null)

Template.newRecord.helpers
  loading: () -> Template.instance().loading.get()
  imageData: () -> Template.instance().imageData.get()
  categories: () -> categories

Template.newRecord.events
  'click .save': (e,t) ->
    $(t.find('form#record'))?.submit()

  'click .takePicture': (e,t) ->
    cameraSuccess = (imageData) ->
      # http://stackoverflow.com/questions/16968945/convert-base64-png-data-to-javascript-file-objects
      # https://developer.mozilla.org/en-US/docs/Web/API/URL.createObjectURL

      # file = new Blob(["data:image/png;base64"],  {type: 'image/png', encoding: 'utf-8'})
      # fr = new FileReader()
      # fr.readAsText(file, "utf-8")
      # processImage file, 500, 500, (data) ->
      #   t.imageData.set(data)

      t.imageData.set("data:image/jpeg;base64," + imageData)
    cameraError = (message) ->
      error message

    navigator.camera.getPicture cameraSuccess, cameraError, 
      quality: 50
      destinationType: Camera.DestinationType.DATA_URL

  'change input[type=file]': (e,t) ->
    file = e.target.files[0]

    processImage file, 500, 500, (data) ->
        t.imageData.set(data)

  'submit form#record': formSubmit (e, t, values) ->

    unless disconnected()
    
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

      imageData = t.imageData.get()
      unless imageData
        if Meteor.isCordova
          error "Snap a picture of a receipt!"
        else
          error "Attach a receipt!"
        return

      Receipts.insert imageData, (err, fileObj) ->
        if err
          t.loading.set(false)
          console.log err
          error err.reason
        else
          Meteor.call 'newRecord', note, amount, category, fileObj._id, (err) ->
            t.loading.set(false)
            if err
              console.log err
              error err.reason
            else
              Router.go 'home'

        
  'click .cancel': (e,t) ->
    Router.go 'home'
