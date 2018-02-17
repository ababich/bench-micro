require "./crystal-kemal/*"
require "kemal"

get "/" do
  "Hello World!"
end

# Kemal.config.logging = false
Kemal.config.port = 3001

Kemal.run
# TODO: Write documentation for `Crystal::Kemal`
# module Crystal::Kemal
#   # TODO: Put your code here
# end
