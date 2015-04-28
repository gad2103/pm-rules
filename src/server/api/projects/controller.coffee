###* Using Rails-like standard naming convention for endpoints.
# * GET     /models              ->  index
# * POST    /models              ->  create
# * GET     /models/:id          ->  show
# * PUT     /models/:id          ->  update
# * DELETE  /models/:id          ->  destroy
###

nedb = require 'nedb'
usersDB = new nedb
  'filename': '../../data/projects.db'
  'autoload': true

# Set the auto compaction.
usersDB.persistence.setAutocompactionInterval 300000

exports.list = (req, res) ->
  usersDB.find {}, (err, data) ->
    return handleError res, err if err
    res.json data

exports.get = (req, res) ->
  usersDB.findOne '_id': req.params.id, (err, data) ->
    return handleError res, err if err
    res.json data

exports.create = (req, res) ->
  usersDB.insert req.body, (err, data) ->
    return handleError res, err if err
    res.json data

exports.update = (req, res) ->
  delete req.body._id
  usersDB.update '_id': req.params.id, req.body, {}, (err, numReplaced) ->
    return handleError res, err if err
    res.json {}

exports.delete = (req, res) ->
  usersDB.remove '_id': req.params.id, {}, (err, numRemoved) ->
    return handleError res, err if err
    res.json {}
