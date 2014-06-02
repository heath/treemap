Trees = require '../models/trees'

list = (req, res) ->
  Trees.list()
  .then (trees) -> res.json trees

get = (req, res) ->
  Trees.get req.params.tree_id
  .then (tree) -> res.json tree

create = (req, res) ->
  lon = parseFloat req.body.lon
  lat = parseFloat req.body.lat
  name = req.body.name
  Trees.create( lon, lat, name)
  .then (tree) -> res.json tree

update = (req, res) ->
  Trees.update req.params.tree_id, req.body
  .then (tree) -> res.json tree

getTreeNear = (req, res) ->
  lat = parseFloat req.query.lat
  lon = parseFloat req.query.lon
  Trees.getParkNear lat, lon
  .then (tree) -> res.json tree

within = (req, res) ->
  lon1 = parseFloat req.query.lon1
  lat1 = parseFloat req.query.lat1
  lon2 = parseFloat req.query.lon2
  lat2 = parseFloat req.query.lat2
  Trees.within lat1, lon1, lat2, lon2
  .then (tree) -> res.json tree

exports.install = (app) ->
  app.get  "/trees", list
  app.get  "/trees/tree/:id", get
  app.post "/trees/tree/:id", create
  app.get  "/trres/near", getTreeNear
  app.get  "/trees/within", within
