'use strict'

Chaplin    = require 'chaplin'
Collection = require 'collections/search'
View =
  Site:      require 'views/site'
  Search:    require 'views/search'

module.exports = class Search extends Chaplin.Controller
  beforeAction:
    '.*': ->
      @compose 'site', View.Site
      @compose 'search', ->
        @collection = new Collection()
        @view = new View.Search
          autoRender: yes
          region: 'search'
          collection: @collection

  show: ->
    # Do nothing; as everything is done in the before action
