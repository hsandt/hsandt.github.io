---
layout: portfolio_item
title: "pico sonic"
subtitle: "1-stage demake of Sonic 3 made with PICO-8"
categories: video-game indie fan-game
asset-dir: "pico-sonic"
thumbnail: "picosonic_itch_banner_cropped_420x420_animated.gif"
banner: "picosonic_itch_banner_cropped_420x420_animated.gif"
youtube:
  id: aW1FSE64CBQ
  title: "pico sonic SAGE 2021 Trailer with text (v5.4 footage)"
screenshots:
  - path: "picosonic v6.1 Start Cinematic screenshot.png"
    description: "Game start cinematic with emeralds"
  - path: "picosonic - spin dash v6.0 (no smoke) main frame.png"
    description: "Spin dash"
  - path: "picosonic_showcase.png"
    description: "Loop-the-loop"
  - path: "picosonic v7.0 - try again.gif"
    description: "Try again with Eggman juggling with the emeralds"
meta:
  release: "Jan 2021"
  platform: "Windows, macOSX, Linux, Web, PICO-8"
  genre: "Platformer"
  mode: "1 player"
  working-period: "May 2018 - Feb 2023"
  team: "1 person + chiptune resources from external composer"
  role: "Programming, Sprite/SFX/jingle adaptation, BGM adjustments"
  technology: "PICO-8"
deliverable_links:
  - platform: itchio
    url: "https://komehara.itch.io/pico-sonic"
    title: Play on itch.io
  - platform: github
    url: "https://github.com/hsandt/sonic-pico8"
    title: Source code on GitHub
---

## Description

**pico sonic** is a partial demake of Sonic the Hedgehog 3 made with PICO-8. It features a simplified version of Angel Island Act 1 with some tweaks. Various classic Sonic games were used as reference, including the 8-bit games (Game Gear and Master System), which have sprites closer to PICO-8's resolution and color palette, and the GBA titles, which have more clear-cut graphics.

## Disclaimer

pico sonic is a fan game distributed for free and is not endorsed by Sega. Sega Games Co., Ltd owns the Sonic the Hedgehog trademark and copyrights on the original assets.

## Screenshots

{% include portfolio-item-screenshots.html screenshots=page.screenshots %}

## Context

The project was started as a personal challenge and was meant to be a fully-fledged fan game, but I eventually dropped many features to focus on Sonic's main movements and the exploration of the stage. Consider it a technical demo with some exploration challenge.

## Role

### Programming

I programmed the whole game in PICO-8's Lua flavor, using my own framework, [pico-boots](https://github.com/hsandt/pico-boots).

- Splash screen with sampled voice
- Main menu
- Game start and level intro cinematic
- Platformer physics following [Sonic Physics Guide](http://info.sonicretro.org/Sonic_Physics_Guide) and [TASVideos Resources for Sonic the Hedgehog](http://tasvideos.org/GameResources/Genesis/SonicTheHedgehog.html)
- Emerald pick-up logic and HUD
- Audio programming: dynamic music and SFX
- Stage clear animation
- Try again screen
- Credits roll

### Sprite/SFX/jingle adaptation

I adapted sprites and sound effects from the original game to fit in PICO-8's 8-bit color palette and audio synthetizer.

### BGM adjustments

The core work of converting original tracks to 8-bit tunes for famitracker was done by [danooct1](https://www.youtube.com/@8BitDanooct1).

My work was to convert those them to PICO-8 chiptune by simplifying them even further, selecting the most relevant channels and notes.
