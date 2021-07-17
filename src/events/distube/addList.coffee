Event = require "../../structures/Event"
{ MessageEmbed } = require "discord.js"

class addList extends Event
  constructor: (args...) ->
    super args...

  run: (message, queue, playlist) ->
    embed = new MessageEmbed;
    embed.setColor "BLUE"
    embed.setDescription "Playlist #{playlist.name} added (#{playlist.total_items} songs in total) by #{song.user}"

    message.channel.send embed;

module.exports = addList;
