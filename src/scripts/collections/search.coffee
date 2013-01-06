'use strict'

Collection = require 'lib/collections/collection'

module.exports = class Search extends Collection

  url: 'http://www.omdbapi.com/'

  parse: (data) ->
    # This is not even close to a RESTful API -- handle its weirdness.
    if data.Search?
      # We should have some results
      data.Search

    else
      # No results; some error message probably..
      []
