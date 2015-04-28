# Configure the Private Controller.
define 'projects/list-ctrl', [
  'app'
  'projects/service'
], (app) ->
  app.controller 'projectsListCtrl', [
    '$scope'
    'projectsService'
    ($scope, projectsService) ->
      projectsService.list()
      .success (data) ->
        $scope.list = data
  ]
