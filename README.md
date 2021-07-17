# HanekawaBot

Hanekawa is a simple music bot for Discord using Discord.js and Distube.

## Installation

via npm
```sh
npm i @discordjs/opus discord.js distube ffmpeg-static klaw
```
via yarn
```sh
yarn add @discordjs/opus discord.js distube ffmpeg-static klaw
```

#### Dev Dependencies

via npm
```sh
npm i coffeescript dotenv --save-dev
```
via yarn
```sh
yarn add -D coffeescript dotenv
```

Optional: `nodemon`

## Execution Instructions

#### To compile the code
via npm
```sh
npm run build
```
via yarn
```sh
yarn build
```

#### To compile and run
via npm
```sh
npm run dev
```
via yarn
```sh
yarn dev
```

### Change the output path of the compiled files

Go to the `package.json` file and change the following information to the one you want

```
coffee -c --output [The folder you want] --compile ./
```

## Credits

This repository was made with the help of [ravener](https://github.com/ravener) and [his repository](https://github.com/ravener/discord.js-coffee) about Discord bots using CoffeeScript, it is really hard to find this kind of content or documentation.
