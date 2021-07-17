Command = require "../../structures/Command";

class Play extends Command
  constructor: (args...) ->
    super args...,
      name: "play",
      aliases: ["p"]

  run: (client, message, args) ->
    string = args.join " "

    if not string
      message.channel.send "Enter a song name or url"
      return

    if not message.member.voice.channel
      message.channel.send "Enter a voice channel to execute this command"
      return

    try
      client.distube.play message, string
    catch err
      console.error err

module.exports = Play;
