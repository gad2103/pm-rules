# Logging system.
log = require('./lib/log') module.filename

# Load external libraries.
express      = require 'express'
logger       = require 'morgan'
bodyParser   = require 'body-parser'

# Setup the application.
app = express()
app.set 'port', process.env.PORT || 3000
app.set 'query parser', 'simple'
app.disable 'etag'
app.use logger 'dev'
app.use express.static '../web'

# Parsing post.
app.use bodyParser.json()
app.use bodyParser.urlencoded extended: true

# API calls.
app.use '/api/v1/projects',    require './api/projects'

# Start the server app.
app.listen app.get('port'), ->
  log.info 'Express server listening on port', app.get 'port'
