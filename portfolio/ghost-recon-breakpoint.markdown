---
layout: portfolio_item
title: "Ghost Recon: Breakpoint"
subtitle: "Open-world RPG military shooter"
categories: video-game
youtube:
  id: 5dcI6CZJI7Y
  title: "Ghost Recon Breakpoint: What is Breakpoint? Gameplay Trailer"
meta:
  developer: "Ubisoft Paris + sister studios"
  release: "Oct 2019"
  platform: "Windows, PS4, Xbox One"
  genre: "Shooter, Stealth, RPG"
  mode: "1-4 players co-op and 4v4"
  play-time: "25h - 100h"
  working-period: "Aug 2017 - Aug 2018"
  team: "~200 people"
  role: "Gameplay programming (3C)"
  technology: "Anvil (proprietary engine)"
---
![Ghost Recon Breakpoint Banner](/assets/pictures/Ghost-Recon-Breakpoint-Title-1024x576.jpg)

## Description

[Tom Clancy’s Ghost Recon Breakpoint](https://www.ubisoft.com/en-gb/game/ghost-recon/breakpoint/game-info){:target="_blank"} is an open-world military shooter that was released in October 2019 by Ubisoft as a sequel to Ghost Recon Wildlands. Like its predecessor, it features a open-world campaign that can be played cooperatively by up to 4 players online and a TvT mode *Ghost War* taking place in closed areas. Compared to Wildlands, this installment features more RPG and survival elements (injuries, crafting, gear enhancement).

## Screenshots

<div class="grid">
  <img src="/assets/pictures/Ghost-Recon-Breakpoint-Drone-768x432.png" alt="Teamwork">
  <img src="/assets/pictures/Ghost-Recon-Breakpoint-No-HUD-battle-768x432.png" alt="Ghost shooting a rocket">
  <img src="/assets/pictures/Ghost-Recon-Breakpoint-No-HUD-stealth-768x432.jpg" alt="Ghost hiding from a drone">
  <img src="/assets/pictures/Ghost-Recon-Breakpoint-No-HUD-Teamwork-768x432.jpg" alt="Enemy grounded drone">
</div>

## Context

As part of the Gameplay Programmer Graduate Program at Ubisoft, I worked 1 year on Breakpoint in the 3C team, implementing main character features. I coded in C++ using in-house engine *Scimitar/Anvil*.

## Role

### Injury system

To stress the survival aspect of the game, the main character can now suffer long-term injuries that must be healed with items or by resting:

- Update injury level based on damage received
- Implement status maluses related to injuries
- Implement healing items to remove injuries
- Plug camera effects
- Plug character animations and voices
- Support network replication

### Suppressive fire

When the main character is continuously hit by enemy fire for some time, strong visual feedback is shown to the player to emphasize the threat and make it harder to retaliate:

- Plug camera effects (change of blur, FoV…)
- Plug character animations and voices
- Support network replication

### Sync Shot drone

The Sync Shot item allows a single player to target up to 3 targets using drones, to mimic the behavior of AI teammates in Wildlands. By shooting a 4th target, the player can effectively kill a group of 4 targets at once, which in some situations can avoid triggering the alarm.

- Implement Sync Shot drone item usage, recall, and shooting behavior
- Plug character animations
- Support network replication

### Misc

- Plug additional voices (character falls, marks or kills target)
