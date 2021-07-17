Command = require "../../structures/Command";

class Pause extends Command
  constructor: (args...) ->
    super args...,
      name: "pause"
      aliases: ["hold"]

  run: (client, message, args) ->
    if not message.member.voice.channel
      message.channel.send "Enter a voice channel to execute this command"
      return

    queue = client.distube.getQueue message;

    if not queue
      message.channel.send "There is nothing playing at the moment";
      return;

    client.distube.pause message

    message.channel.send "The queue has been paused, use the `resume` command to unpause it"

module.exports =  Pause;
