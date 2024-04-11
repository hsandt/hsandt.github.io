---
layout: post
title:  "Combat Platformer in Godot 4: April 2024 progress"
tag: godot
thumbnail: "2024-04-11/thumbnail.png"
---

Big revamp! I finally switched the whole game to **full custom graphics**. I first worked with a scale similar to the proto character (see [previous post](/devlog/2024/01/06/godot-combat-platformer-progress.html)), then tried smaller scales to draw faster. Below, some character scale research:

![Main character sprite scale research](/assets/pictures/blog/devlog/2024-04-11/paladin_Idle_sword_demo_all_sizes_2024-03-19_@4x.png)

From left to right:

1. **Tiny**: fast to draw, but hard to show details like scars, sword erosion or precise body limbs for animations. Instead, it relies a lot on FX.
2. **Chibi**: I don't like how this one turned out, it was supposed to look like [Momodora I-III](https://rdein.itch.io/) but got ugly and now for some reason, it reminds me of the [horned idol statue](https://mixnmojo.com/galleries/full/full20100912100720.png) in *Indiana Jones and the Fate of Atlantis*.
3. **Small**: It's a nice compromise, I'd go with this one if I had more time.
4. **Normal**: The original reference, I'd go with this one if I hired a pixel artist.
4. **Tall**: A funny experiment with the "thin long legs" pixel art style found in indie games like [Superbrothers: Sword & Sworcery EP](https://store.steampowered.com/app/204060/Superbrothers_Sword__Sworcery_EP/).

In the end I went for the Tiny art style, using references such as [Time for Lunch](https://ldjam.com/events/ludum-dare/53/$366108) (PICO-8 game) and [Necrosphere](https://store.steampowered.com/app/607400/Necrosphere/).

Then I converted the other elements (boss, projectiles/FX) and added new elements (background layers, HUD life gauges) to fit in this style. The ice spike FX is very big so it was quite easy to convert (although the warm up animation needed some tuning), while I had to redo the fireball animation from scratch (and also recolored them).

I also rebuilt the whole level to something symmetrical with a few platforms. Kudos to the [Lospec Pixel School](https://lospec.com/pixel-school/) which helped me tune the color palette! Using Aseprite, it's quite fast with the Indexed Color Mode + Edit Color button.

Since I was busy working on new graphics and plugging the HUD behavior, there is no new gameplay features in this update. I will work on improved boss patterns and main character moves next time.

<video controls loop="loop">
  <source src="/assets/pictures/blog/devlog/2024-04-11/2024-04-11 Godot Boss - 5 platforms, MC attack vs Fireballs and Ice spikes.webm" type="video/webm">
</video>

### Level

- Rebuilt full level as a small, one-screen room with 5 platforms

### Visual

- Main character sprites: Idle (1 frame), Run cycle (4 frames), Attack (7 frames)
- Boss sprites (Tiny art style): Idle (1 frame)
- Fireball sprites (Tiny art style): Move (4 frames)
- Ice spikes (Tiny art style): Warm up (13 frames), Appear (6 frames), Active (4 frames), Disappear (3 frames)
- HUD: Main character life gauge (discrete cells), Boss life gauge (continuous gauge)

### Audio

- SFX: Fireball spawn

TODO: all Godot issues opened between January and today