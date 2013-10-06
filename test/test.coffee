assert = require 'assert'
{print} = require 'util'

mm = require '../'
fs = require 'fs'

#===

mmfs = mm fs, (key, arg) ->
  console.log 'missing method called', key, arg

mmfs.existsSync '.'
mmfs.existSync '.'

#===

fs = mm 'fs', (key, arg) ->
  console.log 'missing method called', key, arg

fs.existsSync '.'
fs.existSync '.'
