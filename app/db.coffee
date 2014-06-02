Promise = require "bluebird"
Mongo   = require "mongo-gyro"
nconf   = require "nconf"

env = nconf.get "env"

host = nconf.get "dbHost"
port = nconf.get "dbPort"
coll = nconf.get "collection"

if env is "develop"
  url = "mongodb://#{host}:#{port}/#{coll}"
else
  user = nconf.get "dbUser"
  pass = nconf.get "dbPass"
  url = "mongodb://#{user}:#{pass}@#{host}:#{port}/#{coll}"

module.exports = db = new Mongo url
