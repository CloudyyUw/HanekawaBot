Command = require "../../structures/Command";

class Resume extends Command
  constructor: (args...) ->
    super args...,
      name: "resume"
      aliases: ["unpause"]

  run: (client, message, args) ->
    if not message.member.voice.channel
      message.channel.send "Enter a voice channel to execute this command"
      return

    queue = client.distube.getQueue message;

    if not queue
      message.channel.send "There is nothing playing at the moment";
      return;

    client.distube.resume message

    message.channel.send "Playing the songs again"

module.exports =  Resume;
