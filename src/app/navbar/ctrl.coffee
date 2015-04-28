# Navigation Bar Controller.
define 'navbar/ctrl', [
  'app'
], (app) ->
  app.controller 'navbarCtrl', [
    '$scope'
    '$location'
    '$route'
    ($scope, $location, $route) ->
      # Routes available.
      $scope.routes = []

      # User display.
      $scope.displayName = ''

      # Highlight the selected tab.
      $scope.navClass = (page) ->
        active = $location.path().indexOf page
        return if active == 0 then 'active' else ''

      # Load all routes.
      $scope.routes = []
      for k, v of $route.routes
        if v.data? and v.data.label? then $scope.routes.push
          'data': v.data
          'path': k
  ]
