Discord = require "discord.js"
fs = require "fs"
Distube = require "distube"

Client = new Discord.Client;
Client.commands = new Discord.Collection;
Client.aliases = new Discord.Collection;
Client.categories = new fs.readdirSync "./src/commands";

Client.Emotes =
  error: "❌",
  success: "☑️",
  play: "▶️",
  queue: "📄",
  stop: "⏹️",
  repeat: "🔁",

Client.distube = new Distube Client, {
  searchSongs: true,
  emitNewSongOnly: true,
  leaveOnFinish: true,
}

["commands", "events"].forEach (x) ->
  require("./start/#{x}") Client;

Client.on "ready", ->
  console.log "🚀"

client.login process.env.TOKEN
