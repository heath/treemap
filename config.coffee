nconf = (require "nconf").env().use "memory"

# develop env
nconf.set "collection", "test"
nconf.set "dbHost", "localhost"
nconf.set "dbPort", 27017
nconf.set "appPort", process.env.PORT or 3000
