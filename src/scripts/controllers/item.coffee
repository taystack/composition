'use strict'

Model =        require 'models/item'
Controller =
  Search:      require 'controllers/search'

View =
  Item:    require 'views/item'

module.exports = class Item extends Controller.Search
  show: (options) ->
    @model = new Model id: options.id
    @view = new View.Item
      region: 'content'
      model: @model

    @view.render()
    @model.fetch()
