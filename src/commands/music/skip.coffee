Command = require "../../structures/Command";

class Skip extends Command
  constructor: (args...) ->
    super args...,
      name: "skip"
      aliases: []

  run: (client, message, args) ->
    if not message.member.voice.channel
      message.channel.send "Enter a voice channel to execute this command"
      return

    queue = client.distube.getQueue message;

    if not queue
      message.channel.send "There is nothing playing at the moment";
      return;

    try
      client.distube.skip message
      message.channel.send "Skipped!"
    catch err
      console.error err

module.exports =  Skip;
