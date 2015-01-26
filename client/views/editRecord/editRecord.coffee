confirmDelete = new ReactiveVar(false)


Template.editRecord.created = ->
  @loadingDelete = new ReactiveVar(false)
  @loadingSave = new ReactiveVar(false)
  # @confirmDelete = new ReactiveVar(false)
  confirmDelete.set(false)



Template.editRecord.events
  'click .cancel': (e,t) ->
    Router.go "record", _id:@_id

  'click .save': (e,t) ->
    note = _.str.trim t.find('input[name=note]').value
    amount = t.find('input[name=amount]').value?.toNumber()
    category = t.find('select[name=category]').value

    if note?.length is 0
      error "You need a note."
      return

    unless amount
      error "Enter a decimal amount"
      return

    unless category
      error "Select a category."
      return

    recordId = @_id

    t.loadingSave.set(true)
    Meteor.call 'updateRecord', recordId, note, amount, category, (err) ->
      t.loadingSave.set(false)
      if err
        console.log err
        error err.reason
      else
        Router.go 'record', _id:recordId

  'click .delete': (e,t) ->
    # t.confirmDelete.set(true)
    confirmDelete.set(true)

  'click .confirm': (e,t) ->
    t.loadingDelete.set(true)
    # t.confirmDelete.set(false)
    confirmDelete.set(false)
    _id = @_id
    Meteor.call 'deleteRecord', _id, (err) ->
      t.loadingDelete.set(false)
      if err
        console.log err
      else
        Router.go "home"


Template.editRecord.helpers
  loadingSave: () -> Template.instance().loadingSave.get()
  loadingDelete: () -> Template.instance().loadingDelete.get()
  confirmDelete: () -> 
    # Template.instance().confirmDelete.get()
    confirmDelete.get()
  categories: () -> categories
  selected: (a, b) -> 
    if a is b then "selected"