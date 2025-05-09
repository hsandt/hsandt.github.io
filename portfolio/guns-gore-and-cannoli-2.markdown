---
layout: portfolio_item
title: "Guns, Gore & Cannoli 2"
subtitle: "Over-the-top run ‘n gun"
categories: video-game company
asset-dir: "GGC2"
thumbnail: "GGC2-Thumbnail-420x420.png"
banner: "GGC2-Banner-1024x576.png"
youtube:
  id: aoXyO38tR5A
  title: "Guns, Gore & Cannoli 2 announcement Trailer"
screenshots:
  - path: "GGC2-1.jpg"
    description: "Guns Gore and Cannoli 2 - Fighting in a bar"
  - path: "GGC2-2.jpg"
    description: "Guns Gore and Cannoli 2 - Fighting with the police"
  - path: "GGC2-3.jpg"
    description: "Guns Gore and Cannoli 2 - Flamethrower"
  - path: "GGC2-4.jpg"
    description: "Guns Gore and Cannoli 2 - Fighting on the beach"
meta:
  developer: "Crazy Monkey Studios (now Rogueside)"
  release: "Mar 2018"
  platform: "Windows, macOS, PS4, Xbox One"
  genre: "Run and gun"
  mode: "1-4 players co-op and PvP"
  play-time: "3h30 - 5h30"
  working-period: "Aug 2016 - Dec 2016"
  team: "5 people"
  role: "Programming, Level design"
  technology: "Unity"
---

## Description

Guns, Gore & Cannoli 2 is the sequel of [Guns, Gore & Cannoli](https://www.rogueside.com/guns-gore-and-cannoli/){:target="_blank"}, an over-the-top run ‘n gun for 1-4 players by Crazy Monkey Studios (now [Rogueside](https://www.rogueside.com/){:target="_blank"}). The game’s campaign features the story of Vinnie, a gangster in the 1940s, over 16 levels from America to Europe. Vinnie can use a variety of melee and fire weapons to eliminate human threats, zombies and bosses. Since the previous game, GGC2 added many weapons, 360° aiming and online co-op.

## Screenshots

{% include portfolio-item-screenshots.html screenshots=page.screenshots %}

## Context

I assisted Crazy Monkey Studios on gameplay and AI programming during my end-of-year internship as part of graduating requirements at Gobelins. I coded in C# using Unity.

## Team

- Steven Verbeek: Production, Project management, UI and network programming
- Paul Rozie: Gameplay and network programming
- [Benjamin Claeys](http://claeysbrothers.be/): Art, Level design
- [Matthias Claeys](http://claeysbrothers.be/): Art, Animation, Audio, Level design

## Role

### Level design

I prototyped a level section made of a series of houses with leaking gas and fire:

- Whiteboxing
- Enemy spawn and destructible placement
- Event trigger and interactive switch placement

### Gameplay programming

I programmed the bomber enemy:

- Airplane movement
- Randomized bombing pattern

### UI programming

I worked on the input hint system for the tutorial sections:

- Display keyboard, mouse or gamepad button icons based on current input device

![Tutorial input hint message: Press LT to jump](/assets/pictures/portfolio/{{ page.asset-dir }}/GCC2-Tutorial-input-hint.png)

### Tool programming

I improved existing tools:

- More robust AI navmesh generation
- More readable debug text

### Misc

- Minor physics optimization