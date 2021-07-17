Command = require "../../structures/Command";
{ MessageEmbed } = require "discord.js"

class Queue extends Command
  constructor: (args...) ->
    super args...,
      name: "queue",
      aliases: ["q"]

  run: (client, message, args) ->
    if not message.member.voice.channel
      message.channel.send "Enter a voice channel to execute this command"
      return

    queue = client.distube.getQueue message;

    if not queue
      message.channel.send "There is nothing playing at the moment";
      return;

    q = queue.songs.map (song, i) -> "#{if i == 0 then "Playing:" else "#{i}:"} #{song.name} [#{song.formattedDuration}]"

    embed = new MessageEmbed;
    embed.setColor "GREEN"
    embed.setTitle "Server Queue"
    embed.setDescription "```#{q.join "\n"}```"

    message.channel.send embed;

module.exports = Queue;
