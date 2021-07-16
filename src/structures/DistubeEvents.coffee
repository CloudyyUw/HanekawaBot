Store = require "./Store"

class DistubeStore extends Store
  constructor: (args...) ->
    super args..., "events/distube"

  set: (event) ->
    super.set event
    @client.distube.on event.name, event._run.bind event
    event

  delete: (name) ->
    event = @get name

    if not event
      return false

    @client.removeAllListeners event.name
    super.delete(name)

module.exports = DistubeStore
