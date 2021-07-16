fs  = require "fs"

module.exports = (client) ->
  console.log "Loading Commands..."

  fs.readdirSync("./src/commands").forEach (local) ->
    commands = fs.readdirSync "./src/commands/#{local}/"
      .filter (x) -> x.endsWith ".js";

    for file in commands
      do (file) ->
        command = require "../commands/#{local}/#{file}"

        if command.name
          client.commands.set command.name, command
        else
          continue
        if command.aliases and Array.isArray command.aliases
          command.aliases.forEach (x) ->
            client.aliases.set x, command.name

    console.log "Loaded Commands"
