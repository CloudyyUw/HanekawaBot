Event = require "../../structures/Event"
{ MessageEmbed } = require "discord.js"

class addSong extends Event
  constructor: (args...) ->
    super args...

  run: (message, queue, song) ->
    embed = new MessageEmbed;
    embed.setColor "GREEN"
    embed.setDescription "The song #{song.name} (`#{song.formattedDuration}`) has been added to the queue by #{song.user}"

    message.channel.send embed

module.exports = addSong;
