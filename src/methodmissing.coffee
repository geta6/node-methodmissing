Proxy = require 'node-proxy'

module.exports = (obj, callback = ->) ->
  obj = require obj if typeof obj is 'string'
  property = obj || {}
  handlers =
    get: (rec, key) ->
      return ->
        if key in property
          if Object::toString.call(property[key]) is '[object Function]'
            return property[key].apply null, arguments
          return property[key]
        else
          return callback key, arguments
    set: (rec, key, val) ->
      property[key] = val
  Proxy.createFunction handlers, ->
    property.apply @, arguments

#fs = new MethodMissing require 'fs'

#console.log fs.existsSync('.')
#console.log fs.existSync('.')

