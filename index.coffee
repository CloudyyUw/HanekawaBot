require("dotenv").config();

discord = require "discord.js";

shard = new discord.ShardingManager "./src/main.js", {
  token: process.env.TOKEN,
  totalShards: "auto"
}

shard.on "shardCreate", (shard) ->
  console.log "[#{new Date().toString().split(' ', 5).join(' ')}] Launched shard ##{shard.id + 1}"

shard.spawn()
