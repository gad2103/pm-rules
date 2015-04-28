# Define the module.
define 'app', [
  # External libraries.
  'angular'
  'angular-bootstrap'
  'angular-bootstrap-tpls'
  'angular-route'
], (angular) ->
  # Register module.
  app = angular.module 'app', [
    'ngRoute'
    'ui.bootstrap'
  ], [
    ->
      console.log 'app.js: initialized app module'
  ]

  # Return.
  app
