# Fly Noclip System

Enhance your gameplay with fly and noclip features in FiveM.

## Features

- Fly mode with adjustable speed
- Noclip mode with adjustable speed
- Permission-based access control

## Requirements

- FiveM server
- ESX Legacy framework

## Installation

1. Download the script from [GitHub](https://github.com/EnderDevelopment/fly-noclip-system)
2. Extract the files into your FiveM server's `resources` directory
3. Add `start FlyNoclipSystem` to your server.cfg
4. Import the `database.sql` file into your database

## Usage

- Press the configured key (default: F) to toggle fly mode
- Press the configured key (default: G) to toggle noclip mode

## Configuration

Edit the `config.lua` file to adjust settings:

```lua
Config = {}

-- Fly and Noclip settings
Config.FlySpeed = 1.0
Config.NoclipSpeed = 1.0
Config.FlyKey = 'F'
Config.NoclipKey = 'G'

-- Permission settings
Config.FlyPermission = 'fly.use'
Config.NoclipPermission = 'noclip.use'
```

## Permissions

- `fly.use`: Allows players to use fly mode
- `noclip.use`: Allows players to use noclip mode

---

## Generated with EnderDevelopment

This plugin was generated in minutes with [EnderDevelopment](https://enderdevelopment.com) — the AI platform that turns your ideas into working Minecraft plugins, Discord bots and FiveM scripts.

**Want your own?** [Generate this project on EnderDevelopment](https://dash.enderdevelopment.com?utm_source=github&utm_medium=readme&utm_campaign=fly-noclip-system&utm_content=bottom) — describe it in one sentence and get the full source code.