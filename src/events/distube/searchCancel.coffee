Event = require "../../structures/Event"
{ MessageEmbed } = require "discord.js"

class Cancel extends Event
  constructor: (args...) ->
    super args...

  run: (message) ->
    embed = new MessageEmbed;
    embed.setColor "RED"
    embed.setDescription "Search canceled"

    message.channel.send embed;

module.exports = Cancel;
