module.exports = (client, message) ->
  if message.author.bot
    return;
  if message.webhookID
    return;
  if message.channel.type == "dm"
    return;

  if !message.member
    await message.guild.members.fetch message.author.id;

  prefix = "h!"
  escapeRegex = (str) -> str.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
  prefixRegex = new RegExp("^(<@!?#{client.user.id}>|#{escapeRegex(prefix)})\\s*");

  if !prefixRegex.test message.content
    return;

  [, matchedPrefix] = message.content.match prefixRegex;
  args = message.content.slice matchedPrefix.length
    .trim().split(/ +/);
  cmd = args.shift().toLowerCase()

  if cmd.length == 0
    if message.content.startsWith "<@!#{client.user.id}>" || message.content.startsWith "<@#{client.user.id}>"
      message.channel.send "#{message.author} | Hello, my prefix is #{prefix}"
      return
    return;

  command = client.commands.get cmd
  if !command
    command = client.commands.get client.aliases.get cmd
  if command and command.voiceChannel == true and !message.member.voice.channel
    message.channel.send "#{client.Emotes.error} | You must be in a voice channel!"
    return
  if command
    command.run client, message, args
  if !command
    message.channel.send "#{client.Emotes.error} | I can't find this command or it doesn't exist"
    return
