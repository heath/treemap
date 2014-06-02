nconf = require("nconf");
require("coffee-script/register");
require("./config");
require("./app/server").listen(nconf.get("appPort"))
