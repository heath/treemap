Promise = require "bluebird"
Mongo   = require "mongo-gyro"
nconf   = require "nconf"

env = nconf.get "env"

host = nconf.get "dbHost"
port = nconf.get "dbPort"
coll = nconf.get "collection"

url = "mongodb://#{host}:#{port}/#{coll}"
  
module.exports = db = new Mongo url
