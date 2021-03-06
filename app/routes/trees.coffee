Trees = require '../models/trees'

list = (req, res) ->
  Trees.list()
  .then (trees) -> res.json trees

find = (req, res) ->
  Trees.find req.params.tree_id
  .then (tree) -> res.json tree

create = (req, res) ->
  lon = parseFloat req.body.longitude
  lat = parseFloat req.body.latitude
  cName = req.body.common
  bName = req.body.binomial
  Trees.create( lon, lat, cName, bName)
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
  app.get  "/trees/tree/:id", find
  app.post "/trees/tree/:id", create
  app.get  "/trees/near", getTreeNear
  app.get  "/trees/within", within
