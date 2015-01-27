e = new ReactiveVar('')

connected = new ReactiveVar(true)

Tracker.autorun ->
  if Meteor.status().connected
    connected.set true
    e.set ''
  else
    connected.set false
    e.set 'Cannot reach server...'

@error = (msg) -> 
  if connected.get() then e.set msg
@noError = (msg) -> 
  if connected.get() then e.set ''

Template.registerHelper 'error', -> e.get()

@disconnected = -> connected.get() is false

Template.registerHelper 'disconnected', ->
  if connected.get()
    return ""
  else
    return "disconnected"
