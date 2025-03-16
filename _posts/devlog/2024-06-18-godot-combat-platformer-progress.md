---
layout: post
title: "Combat Platformer in Godot 4: June 2024 progress"
tags: godot
image: "/assets/pictures/blog/devlog/2024-06-18/thumbnail.png"
thumbnail: "2024-06-18/thumbnail.png"
---

# Summary

## Fireball Rain

The big addition is the Fireball Rain, which is a more classic bullet hell platformer move, inspired by [Marisa's Energy Bombardment](https://www.neoseeker.com/touhou-luna-nights/walkthrough/Boss_Marisa) in Touhou Luna Nights. Except instead of spawn a pillar of light, each fireball spawns a fire AOE that stays on the ground/wall it hit for a while.

The move is more regular that the previous homing fireballs, so it encourages the player to learn the pattern and safe spots to get there quickly rather than adapting to each shot very fast. That said, I find it a bit too regular now, maybe I'll add some randomized offset to force the player to adjust their position a little.

## New moves and animations

Player character can now Air dodge, and existing moves all got a dedicated animation. The boss is also animated when casting a spell and getting hurt.

Here is a video to recap new animations, all while trying to dodge the new Fireball Rain.

<video controls loop="loop">
  <source src="/assets/pictures/blog/devlog/2024-06-18/2024-06-18 Godot Boss - Fireball Rain, new PC animations and Air Slide.mp4" type="video/webm">
</video>

And the player character death animation:

![Player character death animation](/assets/pictures/blog/devlog/2024-06-18/paladin_tiny_Death_demo@8x.gif)

## Simpler level

I removed all the platforms and re-added two so the player character can still jump high enough to reach the boss who is shooting Fireball Rain from very high above.

## First BGM

I was tired of testing in a silent room so I added the first BGM, some free asset [Last Boss 01 (ラストボス01)](https://maou.audio/game_lastboss01/), by MaouDamashii under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/).

# Changelog

## Gameplay

- Player character: shorter ground Slide, add Air Slide
- Player character: Melee attack: allow changing direction when chaining attacks
- Boss: skill: replaced single fireball shot with new Fireball rain (projectile accelerates)
- Projectile: Fireball damages player character but moves through it
- Projectile: Fireball generates fire AOE for a short time after hitting ground or wall

## Level

- Simplify level with only 2 platforms

## Visual

- Player character: Slide, Hurt, Death, Jump, Fall, Crouch, DashAttack, AirSlide + transitions
- Boss: new Idle, Hurt, SpellForward, SpellUpward animations and transitions between them (using AnimationTree)
- Projectile: Fireball warm up FX, Fireball Rain round fireball sprite, Fireball explosion on hit

## Audio

- BGM: Boss theme phase 1 extracted from free BGM "Last Boss ラストボス01" by MaouDamashii

# Godot threads opened

## Issues

- [Animation SpriteFrames panel: FPS field is too small, long numbers (e.g. using decimal fraction) are cropped](https://github.com/godotengine/godot/issues/90868)
- [Animation Tree: State machine nodes view does not refresh on Undo/Redo creating new node (until next click)](https://github.com/godotengine/godot/issues/91065)
- [Code editor: hover debug empty String / StringName variable shows nothing](https://github.com/godotengine/godot/issues/91162)

## Proposals

- [Animation SpriteFrames: add keyboard shortcut to rename animation (default F2)](https://github.com/godotengine/godot-proposals/issues/9550)
