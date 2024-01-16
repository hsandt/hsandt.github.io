---
layout: portfolio_item
title: "Hotshot Racing"
subtitle: "Retro arcade-style racing game"
thumbnail: "Hotshot-Racing-Thumbnail-420x420.png"
categories: video-game
youtube:
  id: Qce9nk7hkYg
  title: "Hotshot Racing | Official Reveal Trailer | Curve Digital"
meta:
  developer: "Sumo Digital"
  release: "Sep 2020"
  platform: "Windows, PS4, Xbox One, Switch"
  genre: "Racing"
  mode: "1-8 players, PvE or PvP"
  working-period: "Nov 2018 - Nov 2019"
  team: "~15 people"
  role: "Programming"
  technology: "Proprietary engine"
---
![Hotshot Racing banner](/assets/pictures/portfolio/Hotshot-Racing_marque_1200x700-1024x597.png)

## Description

[Hotshot Racing](https://curvegames.com/our-games/hotshot-racing/){:target="_blank"} is a retro arcade racing game with a touch of modern design. It features the traditional Time Attack and Grand Prix for a single player, while up to 4 players offline and 8 players online can compete in Arcade races or more exotic game modes such as Cops & Robbers and Drive or Explode. Drift, slipstream behind your opponents and boost toward the goal!

Based on Lucky Mountain Games’ prototype [Racing Apex](https://twitter.com/racingapexgame){:target="_blank"}, it was developed by [Sumo Digital](https://www.sumo-digital.com/){:target="_blank"} and published by Curve Digital (now rebranded [Curve Games](https://curvegames.com/){:target="_blank"}.

## Screenshots

<div class="grid">
  <img src="/assets/pictures/portfolio/Hotshot Racing - Race.jpg" alt="Hotshot Racing - Race">
  <img src="/assets/pictures/portfolio/Hotshot Racing - Cops intro.jpg" alt="Hotshot Racing - Cops intro">
  <img src="/assets/pictures/portfolio/Hotshot Racing - Cops & Robbers.jpg" alt="Hotshot Racing - Cops & Robbers">
  <img src="/assets/pictures/portfolio/Hotshot Racing - 4 players splitscreen.jpg" alt="Hotshot Racing - 4 players splitscreen">
</div>

## Context

I worked on Hotshot Racing as a Game Programmer in Sumo Digital, Nottingham studio, with a team of around 15 people. I coded in C++ with the in-house racing game engine and in C# for external tools.

## Role

### Surface effects

The road is composed of different surfaces with their own properties that affect gameplay and/or visuals, such as mud slowing down cars and emitting dirt particles. The core system was already in place, but I tweaked the way surface effects worked in the engine to better fit Hotshot Racing’s design.

- Change the list of surface effects to fit Hotshot Racing’s tracks
- Show new FX when driving on some surfaces

### Boost charge

The player can charge the car’s boost gauge by drifting or slipstreaming behind opponents. I worked on this feature together with the UI designer.

- Implement charge boost during drift, charge cancel when hitting a wall
- Update boost gauge HUD
- Play SFX to feedback charge success or failure

### Shop

The player can buy car parts in the shop.

- Implement part unlock system
  - Unlock new part when player completes a challenge during the race
  - Show progress on a given challenge (e.g. 5 drifts done out of 10)
- Implement part purchase system
- Implement new parts notification system
- Set up save data

### Tool

I improved the tool used by designers to tweak gameplay and aesthetic parameters at runtime.

- Improve usability (multiple tabs, parameter search, highlighting)
- Added more controls for curve parameter tweaking

### Misc

- Improve debug menu
- Fixe memory leaks