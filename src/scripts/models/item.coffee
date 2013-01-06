'use strict'

Model = require 'lib/models/model'

module.exports = class Item extends Model

  url: -> "http://www.omdbapi.com/?i=#{@get 'id'}"

  parse: (data) ->
    if data.Error? then null else data
