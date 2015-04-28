# Configure the Private Controller.
define 'projects/detail-ctrl', [
  'app'
  'projects/service'
], (app) ->
  app.controller 'projectsDetailCtrl', [
    '$scope'
    '$routeParams'
    '$location'
    'projectsService'
    ($scope, $routeParams, $location, projectsService) ->
      # Retrieve the id.
      _id = $routeParams.id

      # Initialize the object.
      $scope.project = {}

      # Retrieve project.
      if _id != '0'
        projectsService.get _id
        .success (data) ->
          console.log JSON.stringify data._id
          $scope.project = data

      $scope.actionCreate = ->
        projectsService.create $scope.project
        .success (data) ->
          $location.path '/projects'

      $scope.actionSave = ->
        console.log 'actionSave'
        projectsService.update _id, $scope.project
        .success (data) ->
          $location.path '/projects'

      $scope.actionDelete = ->
        projectsService.delete _id
        .success (data) ->
          $location.path '/projects'
  ]
