fs = require "fs"

module.exports = (client) ->
  console.log "Loading Events..."

  load = (local) ->
    events = fs.readdirSync("./src/events/#{local}").filter (x) -> x.endsWith ".js"

    for file in events
      do (file) ->
        if local == "distube"
          l = require "../events/#{local}/#{file}"
          name = file.split(".")[0]
          client.distube.on(name, l.bind null, client)
        else
          l = require "../events/#{local}/#{file}"
          name = file.split(".")[0]
          client.on(name, l.bind null, client)

    ["client"].forEach (x) ->
      load x

    console.log "Loaded events!"
