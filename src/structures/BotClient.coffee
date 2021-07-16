{ Client } = require "discord.js"
Distube = require "distube"

CommandStore = require "./CommandStore"
EventStore = require "./EventStore"
DistubeStore = require "./DistubeEvents"

class BotClient extends Client
  constructor: () ->
    super
      fetchAllMembers: false
      disableMentions: "everyone"
      messageCacheMaxSize: 100
      messageCacheLifetime: 240
      messageSweepInterval: 300

    @config =
      prefix: "h!"
      token: process.env.TOKEN

    @commands = new CommandStore(@)
    @events = new EventStore(@)
    @distubeEvents = new DistubeStore(@)

    @Emotes =
      error: "❌",
      success: "☑️",
      play: "▶️",
      queue: "📄",
      stop: "⏹️",
      repeat: "🔁"

    @distube = new Distube @,
      searchSongs: true,
      emitNewSongOnly: true,
      leaveOnFinish: true

    @on("ready", @onReady.bind(@))


  onReady: ->
    console.log("Ok")
    @ready = true
    @emit("botReady")

  login: ->
    await @init()
    super.login @config.token

  init: ->
    [commands, events, distubeE] = await Promise.all([
      @commands.loadFiles(),
      @events.loadFiles()
      @distubeEvents.loadFiles()
    ])

    console.log("#{commands} commands and #{events} events. And also #{distubeE} Distube events")


module.exports = BotClient
