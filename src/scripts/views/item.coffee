'use strict'

View = require 'lib/views/view'

module.exports = class Index extends View

  template: require 'templates/item'

  attributes:
    id: 'item'

  bindings:
    '.title': 'Title',
    '.rating': 'imdbRating',
    '.rated': 'Rated',
    '.released': 'Released',
    '.genre': 'Genre',
    '.director': 'Director',
    '.plot': 'Plot',
    '.poster':
      attributes: [
        name: 'src'
        observe: 'Poster'
        onGet: (value, name) ->
          if value is 'N/A' then 'http://www.americanhumanefilmtv.org/wp-content/uploads/2011/11/genericMoviePoster-202x300.jpg' else value
      ]
