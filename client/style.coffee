themes = new ReactiveDict()
themes.setDefault 'dark.background',   '#151515'
themes.setDefault 'dark.foreground',   '#0c0c0c'
themes.setDefault 'dark.text',         '#dddddd'
themes.setDefault 'dark.active',       '#dddddd'
themes.setDefault 'dark.inactive',     '#444444'
themes.setDefault 'dark.primary',      '#4d91ea'
themes.setDefault 'dark.secondary',    '#8ee478'
themes.setDefault 'dark.tertiary',     '#cf0033'
themes.setDefault 'dark.warning',      '#FFDC00'
themes.setDefault 'dark.warning.text', '#151515'
themes.setDefault 'dark.error',        '#FF4136'

color = (str) -> themes.get "dark.${str}"

style = new ReactiveDict()
style.setDefault 'nav.height', 90
style.setDefault 'nav.octicon.height', 30
style.setDefault 'nav.notification.height', 25
style.setDefault 'table.row.height', 55
style.setDefault 'toolbar.height', 55
style.setDefault 'input.height', 40
style.setDefault 'button.height', 50

# This needs to be a little more. If theres a new item, then
# we need to make sure it reactively updates the css!
rules = new ReactiveDict()

# body:
#   div:
#     h1:
#       &.title:
#         color: 'blue'

css = (obj, selector="") ->
  for key, value of obj
    if _.isString(value) or _.isNumber(value)
      if selector is "" then throw "No selector?!"
      rules.set("#{selector}|#{key}", value)
    else if _.isPlainObject(value)
      if selector is ""
        selector = key
      else if key[0] is '&'
        selector = "#{selector}#{key}"
      else
        selector = "#{selector} #{key}"
      rule value, selector
    else if _.isFunction(value)
      Tracker.autorun -> rules.set("#{selector}|#{key}", value())
    else
      throw "Not a valid CSS rule #{value}"

# style = document.createElement('style')
# style.setAttribute('media', 'screen')
# style.appendChild(document.createTextNode(''))
# document.head.appendChild(style)
# sheet = style.sheet
# sheet.insertRule(".page .nav .title {}", 0)
# sheet.cssRules[0].style['color'] = 'black'
# sheet.cssRules[0].style['color'] = 'blue'

fullPage = ->
  position: 'absolute'
  top: 0
  bottom: 0
  left: 0
  right: 0


css
  '*': boxSizing('border-box')
  '*:not(input):not(textarea)': _.extend userSelect('none'),
    WebkitTouchCallout: 'none'
  'a':
    textDecoration: 'none'
  'img':
    imageOrientation: 'from-image'
  'html':
    widthpc: 100
  'body':
    widthpc: 100
    WebkitOverflowScrolling: 'touch'
    color: -> color('text')
    backgroundColor: -> color('background')
    margin: 0
    fontFamily: "roboto, helvetica, sans-serif"

css
  '.yield': _.extend fullPage(),
    overflowX: 'hidden'
    '.page': _.extend fullPage(),
      overflowX: 'hidden'
      '.content': _.extend fullPage(), {
          overflowX: 'hidden'
          overflowY: 'scroll'
          '&.under-nav':
            top: -> style.get 'nav.height'
            '&.disconnected':
              top: -> style.get('nav.height') + style.get('nav.notification.height')
        }, do ->
          a =
            '&.above-toolbar': -> style.get('toolbar.height')
          for i in [1...5]
            a["&.above-toolbar#{i}"] = do (i) -> -> style.get('toolbar.height')*i
          return a

css
  '.nav':
    zIndex: 100
    position: 'absolute'
    top: 0
    backgroundColor: -> color('foreground')
    height: -> style.get('nav.height')
    widthpc: 100
    textAlight: 'center'
    lineHeight: -> style.get('nav.height')
    '&.disconnected':
      height: -> style.get('nav.height') + style.get('nav.notification.height')
    '.disconnected':
      height: -> style.get('nav.notification.height')
      top: -> style.get('nav.height')
      right: 0
      left: 0
      backgroundColor: -> color('warning')
      color: -> color('warning.text')
      lineHeight: -> style.get('nav.notification.height')
      fontWeight: 'bold'
    '.title':
      color: -> color('primary')
      display: 'inlineBlock'
      verticalAlign: 'middle'
      lineHeight: 'normal'
      fontSizeem: 2
      





  .title {
    color: @textColor1;
    display: inline-block;
    vertical-align: middle;
    line-height: normal;
    font-size: 2rem;
  }
  .right, .left {
    &:active {
      color: @activeColor;
    }
    .loader {
      margin-top: 30px;
    }
    &.octicon.octicon-pencil {
      font-size: 27px;
    }
    &.octicon {
      font-size: @octiconNavSize;
    }
    .octicon.octicon-pencil {
      font-size: 27px;
    }
    .octicon {
      font-size: @octiconNavSize;
    }
    color: @textColor1;
    line-height: @navHeight;
    * {
      vertical-align: middle;
    }
  }
  .right {
    position: absolute;
    top: 0;
    right: 0;
    padding-left: 25px;
    padding-right: 15px;

  }
  .left {
    position: absolute;
    top: 0;
    left: 0;
    padding-left: 15px;
    padding-right: 25px;
  }
}


.toolbar1 {
  .toolbar;
}

.toolbar {
  position: absolute;
  bottom: 0;
  background-color: @color1;
  width: 100%;
  text-align: center;
  line-height: @toolbarHeight;
  * {
    height: @toolbarHeight;
    box-sizing: border-box;
  }
  span {
    display: inline-block;
    vertical-align: middle;
    line-height: normal;
  }
  :nth-child(1) {
    background-color: @color1;
    color: @textColor2;
  }
  :nth-child(2) {
    background-color: @color1;
    color: @textColor1;
  }
  :nth-child(3) {
    background-color: @color1;
    color: @textColor4;
  }
}

.toolbar2 {
  .toolbar;
  height: 2*@toolbarHeight;
  :nth-child(1) {
    border-bottom: 2px @bodyColor solid;
  }
}

.toolbar3 {
  .toolbar;
  height: 3*@toolbarHeight;
}

.loading {
  .loader {
    position: absolute;
    top: ~"calc(50% - 60px)";
    left: ~"calc(50% - 30px)";
  }
}

.notFound {
  .code {
    text-align: center;
    position: absolute;
    top: ~"calc(50% - 60px)";
    width: 100%;
    font-family: monospace;
    font-size: 64px;
  }
}


.error, .message {
  color: @bodyTextColor;
  text-align: center;
}




@import "views/account/account.import.less";
@import "views/home/home.import.less";
@import "views/newRecord/newRecord.import.less";
@import "views/editRecord/editRecord.import.less";
@import "views/record/record.import.less";
@import "views/settings/settings.import.less";
@import "styles/input.import.less";
@import "components/loader.import.less";
@import "components/iconSplash/iconSplash.import.less";
