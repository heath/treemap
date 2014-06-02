express = require "express"

server = express()

server.use (require "body-parser")()
server.use (require "express-promise")()
server.use (require "cors")
  credentials: true
  origin: true

(require "./routes") server

module.exports = server
