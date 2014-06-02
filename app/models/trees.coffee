db = require "../db"
mongodb = require "mongodb"

BSON = mongodb.BSONPure

Trees = module.exports = exports

Trees.list = ->
  db.find("trees")
  .catch (err) -> console.error err

Trees.get = (id) ->
  treeObjectID = new BSON.ObjectID id
  db.find "trees", { _id: treeObjectID }
  .catch (err) -> console.error err

Trees.create = (lat, lon, name) ->
  db.insert "trees",
    Name : name
    pos  : [ lon, lat ]
  .catch (err) -> console.error err

Trees.getTreeNear = (lon, lat) ->
  db.find "trees", pos: $near: [ lon, lat ]
  .catch (err) -> console.error err

Trees.within = (lat1, lon1, lat2, lon2) ->
  db.find "trees",
    pos:
      $geoWithin:
        $box: [
          [ lon2, lat2 ]
          [ lon1, lat1 ]
        ]
  .catch (err) -> console.error err
