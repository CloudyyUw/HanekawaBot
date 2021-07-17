Command = require "../../structures/Command";

class Filter extends Command
  constructor: (args...) ->
    super args...,
      name: "filter",
      aliases: ["filters", "f"]

  run: (client, message, args) ->
    queue = client.distube.getQueue message;

    if not queue
      message.channel.send "There is nothing playing at the moment";
      return;

    if args[0] and args[0] == "off" and queue.filter
      client.distube.setFilter message, queue.filter
    else if Object.keys(client.distube.filters).includes(args[0])
      client.distube.setFilter message, args[0]

    message.channel.send "Current queue filter: `#{queue.filter || "Off"}`"

module.exports = Filter;
