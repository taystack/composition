'use strict'

View           = require 'lib/views/view'
CollectionView = require 'lib/views/collection_view'

class Item extends View

  template: require 'templates/search/item'

  tagName: 'li'

  bindings:
    '.title': 'Title'
    '.year': 'Year'
    ':el':
      attributes: [
        name: 'data-id'
        observe: 'imdbID'
      ]

module.exports = class Search extends CollectionView

  template: require 'templates/search'

  itemView: Item

  attributes:
    id: 'search'

  listSelector: 'ul.results'

  _request: null

  _term: null

  events:
    'keyup input': (event) ->
      term = $.trim event.target.value
      if term isnt @_term and term isnt ''
        @_term = term
        @_request.abort() if @_request
        @_request = @collection.reset().fetch
          data:
            s: @_term

    'click li': (event) ->
      el = $(event.target)
      el = el.parents('li') unless el.is('li')
      id = el.data 'id'
      @publishEvent '!router:routeByName', 'item', [id]
