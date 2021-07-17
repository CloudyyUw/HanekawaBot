Command = require "../../structures/Command";

class Stop extends Command
  constructor: (args...) ->
    super args...,
      name: "stop",
      aliases: ["leave"]

  run: (client, message, args) ->
    if not message.member.voice.channel
      message.channel.send "Enter a voice channel to execute this command"
      return

    queue = client.distube.getQueue message;

    if not queue
      message.channel.send "There is nothing playing at the moment";
      return;

    client.distube.stop message
    message.channel.send "Stopped!"

module.exports = Stop;
