---
layout: portfolio_item
title: "Mars 21"
subtitle: "Cooperative 2D platformer"
categories: video-game school
asset-dir: "Mars-21"
thumbnail: "Mars-21-Thumbnail.jpeg"
banner: "mars-21-banner-940w.webp"
youtube:
  id: M5UN8gK5P4U
  title: "Mars 21 v1.0 Showcase (Game design, Programming)"
screenshots:
  - path: "Mars 21 0.9.9 - Title menu FR.webp"
    description: "Mars 21 screenshot - title menu in French"
  - path: "Mars-21-screenshot-opening-crashing.webp"
    description: "Mars 21 screenshot - Opening cinematic"
  - path: "Mars-21-screenshot-invisible-platform-ceiling-trap.jpg"
    description: "Mars 21 screenshot - Alien light reveals hidden platform in green"
  - path: "Mars-21-screenshot-climb-down.jpg"
    description: "Mars 21 screenshot - Astronaut is climbing down"
meta:
  school: "Gobelins & Cnam-Enjmin"
  release: "2015"
  platform: "Windows, macOSX, Linux, Web"
  genre: "Platformer"
  mode: "2 players co-op"
  play-time: "4 minutes"
  target-audience: "3-11 years old"
  working-period: "Oct 2015 - Mar 2016"
  team: "4 people"
  role: "Game design, Gameplay programming"
  technology: "Unity 5"
---

## Description

Mars 21 is a cooperative platform game for 2 players on PC. Player 1 controls an astronaut moving on the ground and player 2 controls a flying Martian creature. The two characters have different abilities and the players must cooperate to finish the game.

<div class="item-grid">
    <img src="/assets/pictures/portfolio/Mars-21/astronaut-bust-300h.webp" alt="Astronaut bust">
    <img src="/assets/pictures/portfolio/Mars-21/alien-halo-300h.webp" alt="Alien with halo">
</div>

## Screenshots

{% include portfolio-item-screenshots.html screenshots=page.screenshots %}

## Context

The game was developed in 1 month as our first video game project for the [Interactive Digital Experience curriculum at Gobelins (Paris)](https://www.gobelins.fr/jeu-video/formations/jv60-mastere-specialise-designer-experience-interactive-ludique). The setting of the game is loosely based on science fiction short story collection *The Martian Chronicles* by Ray Bradbury. The game was further polished the following year over 3 months, in parallel with the development of new projects.

## Team

- Long Nguyen Huu: Game design, Level design, Gameplay / UI programming
- Ludovic Marguerie: Game design, Level design, 3D modeling, Story, Sound design
- [Coralie Perot](https://coralieperot.wordpress.com/): Concept art, Character design, Story, Opening movie
- Jean-François Cœur: Graphics programming, Gameplay / UI programming

## Role

### Game design

- Astronaut control design
- Alien damage rules

### Level design

- Setup of environment colliders
- Fine platform and hazard placement
- Checkpoint placement
- Light cues

### Gameplay programming

- Astronaut character controller
- Damage, death and respawn system with checkpoints

### UI programming

- UI tween animations
- UI and movie subtitles localization system

### Build

- WebGL support
- Various optimizations

### 3D integration

- Integration of humanoid model and animations
- Damage particle effects

### Localization

- English translation (from French)

## Unity packages

- [Rewired](https://assetstore.unity.com/packages/tools/utilities/rewired-21676)
- nickgravelyn's UnityToolbag (repository has been removed)
- [DOTween](http://dotween.demigiant.com/)
- [Vexe Framework](https://github.com/vexe/VFW)

## Acknowledgements

- Setting based on *The Martian Chronicles* by Ray Bradbury (especially *The Green Morning* and *The Watchers*)
- [Electric Sparks SFX](https://freesound.org/people/Connum/sounds/11709/) by Connum on freesound (CC-BY-NC 3.0)