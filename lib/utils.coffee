@delay = (ms, func) -> Meteor.setTimeout func, ms

@nonEmptyStrings = (strings...) ->
  for string in strings
    if not (Match.test(string, String) and string.length > 0)
      return false
  return true

@formValues = (e,t) ->
  objs = $(e.target).serializeArray()
  values = {}
  for obj in objs
    if t.find("input[name=#{obj.name}]")?.type is "checkbox"
      if obj.name of values
        values[obj.name].push obj.value
      else
        values[obj.name] = [obj.value]
    else 
      values[obj.name] = obj.value

  file = t.find("input[type=file]")
  if file
    values[file.name] = file.files

  return values

@formSubmit = (func) ->
  return (e,t) ->
    e.preventDefault()
    values = formValues e, t
    func.bind(@)
    func(e,t,values)
    return false

@validEmail = (email) ->
  # Trim and validate
  re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
  return re.test(email)