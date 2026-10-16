---
layout: portfolio_item
title: "REORDERED"
subtitle: "Real-time 8-bit lexical puzzle game"
categories: video-game indie jam pico-8
asset-dir: "reordered"
thumbnail: "thumbnail_reordered_v0.3_LV4_LAKE_1.png"
video-fallback-image: "reordered_v0.2_LV1_2_ERA_LACE_pad_470x256.gif"
# TO FINISH: has actual portfolio page from old website
screenshots:
  - path: "reordered_v0.3_LV2_LACE_start.png"
    description: "Reordered level 2 with 2 fixed arrows and 1 toggable arrow - must transform ALEC to LACE"
  - path: "reordered_v0.3_LV3_MUG_8.png"
    description: "Reordered level 3 with 1 fixed arrow, 1 toggable arrow, 3 fixed mirrors and 1 toggable mirror - must transform GUM to MUG"
meta:
  status: "Finished"
  release: "Jan 2018"
  platform: "Windows, macOS, Linux, Web, PICO-8"
  genre: "Puzzle"
  mode: "1 player"
  play-time: "2 minutes (4 levels)"
  target-audience: "Retro/puzzle game enthusiasts"
  working-period: "Jan 2018 (jam weekend + 4 days)"
  team: "1 person"
  role: "Game design, Programming, Art, Audio"
  technology: "PICO-8"
deliverable_links:
  - platform: itch-io
    url: "https://komehara.itch.io/reordered"
    title: Play on itch.io
  - platform: github
    url: "https://github.com/hsandt/ggj2018-Transmission"
    title: Source code on GitHub
---

## Description

REORDERED is a puzzle game where the player must reorder letters  moving in a 2D space by interacting with the environment, in order to  form an imposed word.

A given word is decomposed in letters that are sent at regular  intervals from an emitting antenna. A letter travels in straight line  until it reaches an element that affects its trajectory. The player can  enable and disable those elements in order to guide the letters into a  certain direction.

Letters eventually arrive on a receiving antenna to compound a word  again. Some trajectories being longer than others, letters are  effectively reordered by the timely toggling of interactive elements,  causing a new word to be created.

The game consists of 4 levels defined by:

- a tilemap containing elements that affect the letters’ motion, some fixed and some that can be toggled
- an initial word sent
- a goal word that the player must recompose by reordering the letters

## Features

- 4 levels with a word to form
- Mouse control
- Debug keys
- Simple graphics
- Simple BGM and SFX

## Playing instructions

Either use one of the download links above, or go to the [itch.io page](https://hsandt.itch.io/reordered).

### Controls

| Action                     | Keyboard    | Mouse                           | Sprite                                                                                                               |
| -------------------------- | ----------- | ------------------------------- | -------------------------------------------------------------------------------------------------------------------- |
| Start emitting letters     | X           |                                 | ![emitter sprite](/assets/pictures/portfolio/REORDERED/emitter.png#test){: .crisp width="32px"}                      |
| Toggle interactive element |             | Click on interactive element    | ![toggable arrow right sprite](/assets/pictures/portfolio/REORDERED/toggable_arrow_right.png){: .crisp width="32px"} |
| Restart level              |             | Click on top-right Restart icon | ![restart icon](/assets/pictures/portfolio/REORDERED/restart.png){: .crisp width="32px"}                             |
| (Debug) Previous level     | Left arrow  |                                 |                                                                                                                      |
| (Debug) Next level         | Right arrow |                                 |                                                                                                                      |

## Screenshots

{% include portfolio-item-screenshots.html screenshots=page.screenshots %}

## Context

I made this game for the Global Game Jam 2018 on theme *Transmission*. As all the jam sites around me were already full, I took part in the  event unofficially and the game is not registered on the GGJ website. I  also wanted to start making games with [PICO-8](https://www.lexaloffle.com/pico-8.php) (which uses Lua) so I thought it was a good opportunity to try the fantasy console.

After the jam, I spent 4 more days to improve the game, adding 3 new levels, music and sound effects. You can read more on my [micro post-mortem](/devlog/2018/01/28/pico-8-game-reordered-for-ggj-2018/).

## Role

### Level design

I created 2 maps with 2 challenges each, for a total of 4 levels.

### Programming

To find valid English anagrams, I wrote a [Python script](https://github.com/hsandt/GGJ2018-Transmission/blob/master/offline/read_english_dictionary.py) to permute letters in words taken from a list of [English words](https://github.com/dwyl/english-words). I only needed to run it offline, at design time.

I wrote the whole game code in one PICO-8 Lua file. This was a very small project, but I managed to add a few things that usually don’t make into jam code:

- Coroutines (to send letters periodically and delay visual/audio effects)
- Unit tests (with simple assertions on game start)

Helper code eventually made it into my own PICO-8 framework, [pico-boots](https://github.com/hsandt/pico-boots), which I used for further PICO-8 projects.

### Other

I made my own "programmer art" to represent level items and created simple audio inside PICO-8 for player feedback.