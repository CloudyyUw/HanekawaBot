Event = require "../../structures/Event"
{ MessageEmbed } = require "discord.js"

Status = (queue) ->
  "Volume: `#{queue.volume}%` | Filter: `#{if queue.filter then queue.filter else "Off"}` | Loop: `#{if queue.repeatMode then if queue.repeatMode == 2 then "All Queue" else "This Song" else "Off"}` | AutoPlay: `#{if queue.autoplay then "On" else "Off"}`"

class playSong extends Event
  constructor: (args...) ->
    super args...

  run: (message, queue, song) ->
    embed = new MessageEmbed;
    embed.setTitle "Now Playing"
    embed.setDescription "#{song.name} - [`#{song.formattedDuration}`]\nRequested by: #{song.user}\n#{Status(queue)}"
    embed.setColor "GREEN"

    message.channel.send embed

module.exports = playSong;
