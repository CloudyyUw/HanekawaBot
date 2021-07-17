Event = require "../../structures/Event"
{ MessageEmbed } = require "discord.js"

class searchSongs extends Event
  constructor: (args...) ->
    super args...

  run: (message, result) ->
    i = 0
    songs = result.map (song) -> "#{++i}: #{song.name} [#{song.formattedDuration}]"

    embed = new MessageEmbed;

    embed.setTitle "Choose one of the songs below"

    embed.setFooter "Enter the song number in 60 seconds, or type cancel."

    embed.setDescription "```#{songs.join "\n"}```"

    embed.setColor "RANDOM"

    message.channel.send embed

module.exports = searchSongs;
