# Check if the user is logged or not.
define 'projects/service', [
  'app'
], (app) ->
  # Load application.
  app.factory 'projectsService', [
    '$http'
    ($http) ->
      URL = 'api/v1/projects/'

      # List.
      list: ->
        $http
          'method': 'GET'
          'url': URL

      # Create.
      create: (project) ->
        $http
          'method': 'POST'
          'url': URL
          'data': project

      # Retrieve.
      get: (id) ->
        $http
          'method': 'GET'
          'url': URL + id

      # Update.
      update: (id, project) ->
        $http
          'method': 'PUT'
          'url': URL + id
          'data': project

      # Delete.
      delete: (id) ->
        $http
          'method': 'DELETE'
          'url': URL + id
  ]

  # Return.
  app
