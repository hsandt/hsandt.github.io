---
layout: post
title: "PICO-8 game “REORDERED” for GGJ 2018"
tags: pico-8
image: "/assets/pictures/blog/devlog/2018-01-28-pico-8-game-reordered-for-ggj-2018/thumbnail.png"
thumbnail: "2018-01-28-pico-8-game-reordered-for-ggj-2018/thumbnail.png"
---

*Note: this post has been moved from my old website and adapted.*

![Gameplay video of REORDERED where player clicks on arrow in level to make G letter take a longer path and arrive after I to form word BIG](/assets/pictures/blog/devlog/2018-01-28-pico-8-game-reordered-for-ggj-2018/reordered_v0.1_walkthrough_big.gif)

When I tried to subscribe to Global Game Jam 2018, all the locations in Paris were already full. I still wanted to participate so I decided to make some game on my own.

This year, the theme was *Transmission*. First, I thought about illustrating gene transmission with a character sprite generator that would support inheritance. But I didn’t have any gameplay idea and the project seemed quite complex. I also considered making a game about sending waves in the right direction, but *Wave* was last year’s theme already.

In the end, I thought about using [out-of-order delivery](https://en.wikipedia.org/wiki/Out-of-order_delivery) as a main mechanic, and came up with the concept of modifying a message by reordering its letters.

On the technical side, I went with [PICO-8](https://www.lexaloffle.com/pico-8.php) for the first time.

## Progress

Unfortunately, I didn’t have the time to implement many game bits and levels I designed the first day. This is not something surprising for a jam (especially done alone), but getting used to PICO-8 and its differences with actual Lua made it more difficult than usual.

All in all, I’m quite satisfied with the game, and was even surprised to find alternative ways to solve the most simple puzzle. But it’s clearly too short (only two words to transmit!). I’ll definitely add more levels in a future version.

## Accessibility

A lot to improve on UX and Accessibility. I’m using the mouse devkit feature for PICO-8, but the author himself recommends to always provide button controls. What I fear the most is that players are not able to play the game at all. I’ve already downloaded many jam games I was not able to play for technical reasons or lack of clarity.

At some point I tried a color-blind filter (Deuteranopia), which showed I really couldn’t rely on colors (at least with those I had chosen).

![Screenshot of REORDERED with Deuteranopia filter. Colors range between desaturated blue and yellow](/assets/pictures/blog/devlog/2018-01-28-pico-8-game-reordered-for-ggj-2018/transmission_006_deuteranopia.png)

This year, the organizers suggested a great deal of [diversifiers](https://web.archive.org/web/20230923212256/https://globalgamejam.org/news/ggj18-diversifiers), including for accessibility and narration. With PICO-8, many diversifiers were impossible to get (Well-Rounded, most Audio challenges), others much easier (of course **.COM-pact** – *limit your game file size to 64k or less*, but we could also imagine **Upside down** – *One or more game systems programmed by an artist, major art assets produced by programmers/coders*).

Amusingly, **Lost in translation** – *Make a game which plays differently depending on language selection*, would probably be feasible, provided I offer different words to play with depending on the language.

## Takeaway

If I had to redo it, I would:

- learn more about the engine beforehand
- focus on fewer elements and levels to be sure to implement them
- work on the game flow early, to allow the integration of menu and level loading more easily
- use pseudo-classes with methods rather than normal tables a ton of free functions (PICO-8 supports Lua metatables)

## Play

You can find the latest version of the game on the [itch.io page](https://komehara.itch.io/reordered). Compared to v0.1, it added 4 levels, sfx and music. You can also change level with LEFT and RIGHT.

### Older versions

**v0.1**

- [reordered_v0.1.bin](/assets/games/reordered/reordered_v0.1.bin.zip)
- [reordered_v0.1_web](/assets/games/reordered/reordered_v0.1_web.zip)

### Other links

I will probably post it to PICO-8’s BBS when I deem it’s worth it.

You can also check out the [Git repository](https://github.com/hsandt/ggj2018-Transmission). The code tends to have the usual jam quality, but I’ve made some efforts to organize the code, factorize and even added a few unit tests.
