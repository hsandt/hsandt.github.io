---
layout: portfolio_item
title: "Evil Genius 2: World Domination"
subtitle: "Satirical spy-fi lair builder"
categories: video-game company
asset-dir: "Evil-Genius-2"
thumbnail: "Evil-Genius-2-Thumbnail-420x420.png"
banner: "Evil-Genius-2-Banner_TitleTopRightMargin_1000x563.jpg"
youtube:
  id: HieJmZ3tsdQ
  title: "Evil Genius 2: World Domination – Launch Trailer | PS4, PS5, Xbox One, Xbox Series X/S"
screenshots:
  - path: "Evil-Genius-2 20201103163907_1 (construction).jpg"
    description: "Evil Genius 2 - Construction"
  - path: "Evil-Genius-2-World-Domination06162021-112200-78857 (genius control) from Game UI Database.jpg"
    description: "Evil Genius 2 - Genius control"
  - path: "Evil-Genius-2-World-Domination06162021-112158-85012 (world map) from Game UI Database.jpg"
    description: "Evil Genius 2 - World map"
  - path: "Evil-Genius-2-World-Domination06162021-112155-94083 (minion management) from Game UI Database.jpg"
    description: "Evil Genius 2 - Minion management"
meta:
  developer: "Rebellion Developments"
  release: "Mar 2021"
  platform: "Windows, PS4, PS5, Xbox One, Xbox Series X/S"
  genre: "Construction and management simulation"
  mode: "1 player"
  working-period: "Oct 2020 - Mar 2022"
  team: "~60 people"
  role: "Programming"
  technology: "Proprietary engine"
---

## Description

[Evil Genius 2](https://evilgeniusgame.com/){:target="_blank"} is a construction and management simulation game where you build a hidden lair and manage minions in your quest to conquer the world. In this game packed with old spy movie references, you can upgrade your tech, send minions on missions across the world or even directly control your genius and their henchmen to fight the Forces of Justice and establish true world domination.

## Screenshots

{% include portfolio-item-screenshots.html screenshots=page.screenshots %}

(some screenshots from [Game UI Database](https://www.gameuidatabase.com/gameData.php?id=710){:target="_blank"})

## Context

I worked remotely from France with Rebellion Warwick. I coded in C++ using the in-house engine.

## Role

### Temperature system

The temperature feature was added for the Oceans Campaign Pack DLC. Each furniture in the lair contributes to local temperature, which in turns affects furniture and characters.

- Implement temperature spreading algorithm
- Allow designer to define furniture temperature parameters (intensity and distance)
- Allow designer to define temperature level ranges and their effects on entities (morality loss, etc.)

### Trap combo tracking system

One of the fun parts of the game is to place many traps in a room and let enemy agents fall in them in chain. The player can complete objectives and earn achievements by doing so.

- Implement trap combo detection
- Allow designer to define objective/achievement for all kinds of trap combos

### New events & objectives

I defined new classes of events so designer can apply arbitrary events during missions, and check when an objective has been completed. In particular:

- Detect character arriving in/leaving lair
- Convert character to another type

### Misc

- Misc UI interaction fixes (hiring panel, click and hold)
- Misc fixes on character behavior and animation
- Add debug gizmos (XYZ direction and tile location indicator)
- Various testing and bug reports