

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
      @redirect 'landing'
    else
      @next()
  ,
    except: ['landing', 'login', 'signup', 'forgot', 'reset', 'zip']

Router.route 'landing'


Router.route 'home',
  path: '/'
  waitOn: ->
    if Meteor.userId()
      return subs.subscribe 'records'

Router.route 'newRecord',
  path: 'new'

Router.route 'settings'

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

Router.route 'loading'
Router.route 'notfound'

Router.route 'reset',
  path: 'reset/:id'
  onBeforeAction: ->
    unless @params.id
      @redirect 'leaderboard'
    Session.set 'resetPasswordToken', @params.id
    @next()

Router.route 'zip',
  where: 'server'
  path: 'zip'
  action: ->
    if @request.cookies.meteor_login_token
      u = Meteor.users.findOne({"services.resume.loginTokens.hashedToken": Accounts._hashLoginToken(@request.cookies.meteor_login_token)})

      zip = new JSZip()
      csv = "Date, Note, Amount, ReceiptId\n"
      for record in Records.find({ownerId:u._id}).fetch()
        csv += "#{Date.create(record.date).format('{yy}/{MM}/{dd} {HH}:{mm}')}, #{record.note}, $#{record.amount.format(2)}, #{record.receiptId}\n"

      zip.file('data.csv', csv)

      output = zip.generate
        type:        "nodebuffer"
        compression: "DEFLATE"

      # Set headers
      @response.setHeader("Content-Type", "application/octet-stream")
      @response.setHeader("Content-disposition", "attachment; filename=export.zip")
      @response.writeHead(200)

      # Send content
      @response.end(output)
    else
      return false
