

@subs = new SubsManager
  cacheLimit: 20
  expireIn: 5

Router.configure
  layoutTemplate: 'layout'
  loadingTemplate: 'loading'
  notFoundTemplate: 'notFound'

# if the user isnt logged in, render the login template.
# or the user can signup. But the point is that this
# should reactively update once the user has signed up.
Router.onBeforeAction ->
    if not Meteor.userId()
      @redirect 'login'
    else
      @next()
  , 
    except: ['login', 'signup', 'forgot', 'reset']

  
Router.route 'home',
  path: '/'
  waitOn: -> 
    if Meteor.userId()
      return subs.subscribe 'records'

Router.route 'newRecord',
  path: 'new'

Router.route 'record',
  path: 'record/:_id'
  waitOn: ->
    if Meteor.userId()
      return subs.subscribe 'record', @params._id
  data: ->
    Records.findOne(@params._id)

Router.route 'login'
Router.route 'signup'
Router.route 'forgot'

Router.route 'reset',
  path: 'reset/:id'
  onBeforeAction: ->
    unless @params.id
      @redirect 'leaderboard'
    Session.set 'resetPasswordToken', @params.id
    @next()


# just so you can see them if you want
Router.route 'loading'
Router.route 'notFound'