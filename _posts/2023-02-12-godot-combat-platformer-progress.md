---
layout: post
title:  "Combat Platformer in Godot 4: Feb 2023 progress"
tag: godot
thumbnail: "2023-02-12/2023-02-12-godot-combat-platformer-thumbnail.png"
---

I started working on a side-scrolling combat platformer prototype in Godot 4.
I'm regularly downloading new snapshots of Godot 4 beta which sometimes introduces breaking API changes, but I hope it will be worth it when it finally gets released.

![Combat platformer demo: warrior runs, jumps and slashes a slime](/assets/pictures/blog/2023-02-12/2023-02-12 demo features so far.gif)

I managed to port most of my code for character control/animation from an [older project](https://github.com/hsandt/flame-of-hope-godot/tree/master/Scripts). But it was top-view, so I still had to work more to get running and jumping to work.

The biggest issue I had with physics was a regression on `move_and_slide` (see [this issue](https://github.com/godotengine/godot/issues/71993)). Otherwise, I'd say Godot's built-in classes made it pretty simple. I don't have any custom raycasts in my code so far.

So far I implemented the following features for the player character:
- move and jump
- melee attack: can chain up to two slashes
- health system: get hurt and die

I'd like to make this open source, but as it contains some copyrighted third-party assets (although free).
I may extract the scripts into some public submodule (as with my Unity projects) though, so stay tuned!

Assets used:
- [Warrior-Free Animation set V1.3 by Clembod](https://clembod.itch.io/warrior-free-animation-set)
- [Pixel Slime by rvros (CC0 1.0)](https://rvros.itch.io/pixel-art-animated-slime)
- [Free Pixel Art Grasslands Tileset by Will Tice / unTied Games](https://untiedgames.itch.io/free-grasslands-tileset)
