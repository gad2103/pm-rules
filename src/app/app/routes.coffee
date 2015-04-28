# Define the routing.
define 'app/routes', [
  'app'
  # Individual tabs.
  'tab/home-controller'
  'tab/about-controller'
  # Projects
  'projects/list-ctrl'
  'projects/detail-ctrl'
  # Timelines
  'timelines/main-ctrl'
], (app) ->
  app.config [
    '$routeProvider'
    ($routeProvider) ->
      # Home page.
      $routeProvider.when '/',
        'templateUrl': 'templates/home.html'
        'controller': 'homeController'
      # Sub Projects Master.
      $routeProvider.when '/projects',
        'templateUrl': 'templates/projects/master.html'
        'controller': 'projectsListCtrl'
        'data':
          'label': 'Projects'
          'selected': 'Projects'
      # Sub Projects Detail.
      $routeProvider.when '/projects/:id',
        'templateUrl': 'templates/projects/detail.html'
        'controller': 'projectsDetailCtrl'
        'data':
          'label': null
          'selected': 'Projects'
      # Timelines.
      $routeProvider.when '/timelines',
        'templateUrl': 'templates/timelines/index.html'
        'controller': 'timelinesMainCtrl'
        'data':
          'label': 'Timelines'
          'selected': 'Timelines'
      # About.
      $routeProvider.when '/about',
        'templateUrl': 'templates/about.html'
        'controller': 'aboutController'
        'data':
          'label': 'About'
          'selected': 'About'
      # Invalid routes redirects to Home Page.
      $routeProvider.otherwise
        'redirectTo': '/'
  ]
