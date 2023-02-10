---
layout: portfolio_item
title: "Evil Genius 2: World Domination"
subtitle: "Satirical spy-fi lair builder"
thumbnail: "Evil-Genius-2-Thumbnail-420x420.png"
categories: video-game
youtube:
  id: HieJmZ3tsdQ
  title: "Evil Genius 2: World Domination – Launch Trailer | PS4, PS5, Xbox One, Xbox Series X/S"
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
![Evil Genius 2 banner](/assets/pictures/Evil-Genius-2-Banner_TitleTopRightMargin_1000x563.jpg)

## Description
 
[Evil Genius 2](https://evilgeniusgame.com/){:target="_blank"} is a construction and management simulation game with a touch of modern design. It features the traditional Time Attack and Grand Prix for a single player, while up to 4 players offline and 8 players online can compete in Arcade races or more exotic game modes such as Cops & Robbers and Drive or Explode. Drift, slipstream behind your opponents and boost toward the goal! Based on Lucky Mountain Games’ prototype [Racing Apex](https://twitter.com/racingapexgame){:target="_blank"}.

## Screenshots

<div class="grid">
  <img src="/assets/pictures/Evil-Genius-2 20201103163907_1 (construction).jpg" alt="Evil Genius 2 - Construction">
  <img src="/assets/pictures/Evil-Genius-2-World-Domination06162021-112200-78857 (genius control) from Game UI Database.jpg" alt="Evil Genius 2 - Genius control">
  <img src="/assets/pictures/Evil-Genius-2-World-Domination06162021-112158-85012 (world map) from Game UI Database.jpg" alt="Evil Genius 2 - World map">
  <img src="/assets/pictures/Evil-Genius-2-World-Domination06162021-112155-94083 (minion management) from Game UI Database.jpg" alt="Evil Genius 2 - Minion management">
</div>

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