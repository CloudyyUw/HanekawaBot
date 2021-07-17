Command = require "../../structures/Command";

class Loop extends Command
  constructor: (args...) ->
    super args...,
      name: "loop",
      aliases: ["l"]

  run: (client, message, args) ->
    if not message.member.voice.channel
      message.channel.send "Enter a voice channel to execute this command"
      return
      
    queue = client.distube.getQueue message;

    if not queue
      message.channel.send "There is nothing playing at the moment";
      return;

    mode = null
    switch args[0]
      when "off"
        mode = 0
      when "song"
        mode = 1
      when "queue"
        mode = 2

    mode = client.distube.setRepeatMode message, mode
    mode = if mode then if mode == 2 then "Repeat queue" else "Repeat song" else "Off"

    message.channel.send "Set repeat mode to `#{mode}`"

module.exports = Loop;
