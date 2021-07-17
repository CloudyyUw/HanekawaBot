Event = require "../../structures/Event"
{ MessageEmbed } = require "discord.js"

Status = (queue) ->
  "Volume: `#{queue.volume}%` | Filter: `#{if queue.filter then queue.filter else "Off"}` | Loop: `#{if queue.repeatMode then if queue.repeatMode == 2 then "All Queue" else "This Song" else "Off"}` | AutoPlay: `#{if queue.autoplay then "On" else "Off"}`"

class playList extends Event
  constructor: (args...) ->
    super args...

  run: (message, queue, playlist, song) ->
    embed = new MessageEmbed;
    embed.setColor "GREEN"
    embed.setDescription "Now playing #{song.name} (`#{song.formattedDuration}`), from playlist #{playlist.name}, which was added by #{song.user}\n#{Status(queue)}"

    message.channel.send embed;

module.exports = playList;
