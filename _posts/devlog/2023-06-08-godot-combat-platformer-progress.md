---
layout: post
title:  "Combat Platformer in Godot 4: June 2023 progress"
tag: godot
image: "/assets/pictures/blog/devlog/2023-06-08/thumbnail.png"
thumbnail: "2023-06-08/thumbnail.png"
---

I have added a few features to my prototype of combat platformer made in Godot since February, as well as less visible QoL/debug improvements:

### Gameplay

- Actions: Slide, airborne Attack
- Flow: better action constraints (cannot move while attacking on ground, but can move when attacking airborne, with locked direction)
- Enemy AI: Behaviour Trees with [Yet Another Behavior Tree](https://github.com/AdrienQuillet/godot-yet-another-behavior-tree)

### Visual
- Feedback: red hurt color, blue invincible color during Slide
- More robust animation system with base (continuous) animations like Run + override (one-time) animations like Attack

<video autoplay="autoplay" loop="loop" width="400" height="300">
  <source src="/assets/pictures/blog/devlog/2023-06-08/2023-06-08 Godot 4 Platformer Combat progress.webm" type="video/webm">
</video>

### Debug
- Restart all entities immediately when pressing R
- Debug overlay: FPS, current frame, currently pressed input

<video autoplay="autoplay" loop="loop" width="640" height="360">
  <source src="/assets/pictures/blog/devlog/2023-06-08/2023-06-08 Godot 4 Platformer Combat - Debug overlay demo.webm" type="video/webm">
</video>

Assets used:
- [Warrior-Free Animation set V1.3 by Clembod](https://clembod.itch.io/warrior-free-animation-set)
- [Animated pixel art skeleton by AstroBob](https://astrobob.itch.io/animated-pixel-art-skeleton)
- [Free Pixel Art Grasslands Tileset by Will Tice / unTied Games](https://untiedgames.itch.io/free-grasslands-tileset)
