---
layout: post
title: "Snake remake in Godot 4: October 2023 progress"
tags: godot
image: "/assets/pictures/blog/devlog/2023-10-11/thumbnail.png"
thumbnail: "2023-10-11/thumbnail.png"
---

In July 2023, I started working on a "Snake with a twist" in parallel to my other games. It's a smaller project that I intend to finish within 100 hours of work, using only geometrical graphics and simple arcade mechanics to avoid artistic and technical difficulties (game design will probably be the most difficult part).

![Snake Evolved: wrap-around and laddering](/assets/pictures/blog/devlog/2023-10-11/Snake Evolved - 2023-08-29 - wrap-around and laddering.gif){: height="360" }

My latest addition is moving enemies. They currently move at half the speed of the player snake, but they still make the game significantly harder: new enemies regularly spawn and keep coming at you, and touching them causes instant game over. You can trick them by repeatedly warping to the other side of the arena, but I may eventually fix this by making enemies aware of edge warping to find the real shortest distance to player snake.

<video controls width="640" height="360">
  <source src="/assets/pictures/blog/devlog/2023-10-11/Snake Evolved - 2023-10-10 - Adding moving enemies - Eat and lose 720p.webm" type="video/webm">
  Your browser does not support the video tag.
</video>

One problem is inherent to snake: you cannot control the tail, so it is very vulnerable, even more as your snake gets longer. I may mitigate this by reducing penalty when a body part other than the head hits an enemy.

## Dev status

Total work time: 27h

### Gameplay

- Player character: move like a classic snake (hold diagonal for laddering)
- Pick-up: eat to extend snake length by 1 and increase Score

### Visual

- Dark background
- All sprites are colored squares

### HUD

- Display score in top-left corner

### Known issues

- Pick-up and enemies can spawn anywhere, including near and inside the player snake without warning!