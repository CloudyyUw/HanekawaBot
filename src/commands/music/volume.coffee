Command = require "../../structures/Command";

class Volume extends Command
  constructor: (args...) ->
    super args...,
      name: "volume"
      aliases: ["v"]

  run: (client, message, args) ->
    if not message.member.voice.channel
      message.channel.send "Enter a voice channel to execute this command"
      return

    queue = client.distube.getQueue message;

    if not queue
      message.channel.send "There is nothing playing at the moment";
      return;

    volume = parseInt args[0]

    if isNaN volume
      message.channel.send "Please enter a valid number!"
      return

    client.distube.setVolume message, volume

    message.channel.send "Volume set to `#{volume}`"

module.exports =  Volume;
