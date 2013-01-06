'use strict'

View = require 'lib/views/view'

module.exports = class Index extends View

  template: require 'templates/site'

  attributes:
    id: 'site'

  regions:
    '.search-container': 'search'
    '.content-container': 'content'
