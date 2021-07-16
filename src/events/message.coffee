Event = require "../structures/Event"

class Message extends Event
  constructor: (args...) ->
    super args...
    @prefix = @client.config.prefix

  run: (message) ->
    return if message.author.bot or message.webhookID or message.channel.type == "dm"

    if not message.member
      await message.guild.members.fetch message.author.id

    return if not message.content.startsWith @prefix

    args = message.content.slice(@prefix.length).trim().split(/ +/g)
    cmd = args.shift().toLowerCase()
    command = @client.commands.get cmd

    if not command
      message.channel.send "Unknown Command"

    await command.run @client, message, args
    return;

module.exports = Message;
