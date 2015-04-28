# Check if the user is logged or not.
define 'timelines/service', [
  'app'
  'projects/service'
], (app) ->
  # Load application.
  app.factory 'timelinesService', [
    '$q'
    'projectsService'
    ($q, projectsService) ->
      # List.
      byInitiative: ->
        # A promise.
        deferred = $q.defer()

        projectsService.list()
        .success (data) ->
          # Store the values.
          tree = []
          top = {}
          middle = {}
          for sb in data
            # Create if not exists.
            if !top[sb.initiative]?
              top[sb.initiative] =
                'title': sb.initiative
                'nodes': []
              tree.push top[sb.initiative]

            # Populate the projects.
            if !middle[sb.project]?
              middle[sb.project] =
                'title': sb.project
                'nodes': []
              top[sb.initiative].nodes.push middle[sb.project]

            # Populate the subproject.
            middle[sb.project].nodes.push
              'title': sb.name
              'start': sb.dev.start_date || ''
              'end': sb.dev.end_date || ''


          # TODO: convert the data into something useful.
          console.log 'timelinesService.byInitiative: data=', JSON.stringify tree, null, '  '
          deferred.resolve tree

        # Return.
        deferred.promise

      # Create.
      byDeveloper: ->
        projectsService.list()
        .success (data) ->
          console.log 'timelinesService.byInitiative: data=', data
  ]

  # Return.
  app
