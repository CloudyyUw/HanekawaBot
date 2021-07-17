Event = require "../../structures/Event"

class Err extends Event
  constructor: (args...) ->
    super args...

  run: (message, err) ->
    console.error err;

module.exports = Err;
