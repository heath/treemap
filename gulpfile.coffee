gulp = require "gulp"

nodemon = require "gulp-nodemon"

gulp.task "server", ->
  nodemon
    script: "index.js"
    ext: "coffee"
    ignore: ['node_modules/**']

gulp.task "default", [
  "server"
]
