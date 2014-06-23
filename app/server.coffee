express = require "express"

server = express()

server.use (require "body-parser")()
server.use (require "express-promise")()

# allow cors
server.all "*", (req, res, next) ->
  res.header "Access-Control-Allow-Origin", "*"
  res.header "Access-Control-Allow-Headers", "Content-Type"
  next()

(require "./routes") server

module.exports = server
