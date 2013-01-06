#! Defines the routes for the application.
'use strict'

module.exports = (match) ->
  match '', 'index#show'
  match 'search', 'search#show'
  match 'search/:id', 'item#show', name: 'item'
