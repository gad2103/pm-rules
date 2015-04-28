# Configure the Private Controller.
define 'timelines/main-ctrl', [
  'app'
  'timelines/service'
], (app) ->
  app.controller 'timelinesMainCtrl', [
    '$scope'
    'timelinesService'
    ($scope, timelinesService) ->
      $scope.data = []
      timelinesService.byInitiative()
      .then (data) ->
        console.log data
        $scope.data = data
  ]
