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
      @compose 'search',
        compose: ->
          composition =
            collection: new Collection()

          composition.view = new View.Search
            region: 'search',
            collection: composition.collection

          composition.view.render()

          # Return our composition; the composer will take care
          # of rendering and disposal
          composition

  show: ->
    # Do nothing; as everything is done in the before action
