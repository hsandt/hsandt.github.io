---
layout: post
title: "C++ 2D Game Engine – Postmortem"
tags: c++ game-engine
image: "/assets/pictures/blog/devlog/2019-05-24-c++-2d-game-engine-postmortem/thumbnail.png"
thumbnail: "2019-05-24-c++-2d-game-engine-postmortem/thumbnail.png"
---

4 years ago, I started working on a custom 2D game engine in C++. At the beginning, I needed a simple game to experiment AI techniques with, but I ended up working on a small engine (I still wanted to train AI to I moved that project to Unity).

The main features I am aiming at are:

- Entity-component system
- Fixed update and input/render update loops
- Game window with OpenGL with [GLEW](http://glew.sourceforge.net/){:target="_blank"} + [GLFW](http://www.glfw.org/){:target="_blank"}
- Keyboard/mouse input
- Primitive 2D shapes rendering
- Basic shaders
- 2D physics ([Box2D](http://box2d.org/){:target="_blank"})
- Scene-Entity system
- Scene editor and basic scene serialization
- AI helpers
- Unit tests ([Catch2](https://github.com/catchorg/Catch2){:target="_blank"})
- Sample game

At first I used [SDL2](https://www.libsdl.org/index.php){:target="_blank"} for window management and rendering, before switching to OpenGL with GLFW for more flexibility (e.g. zooming in and out with the camera). Now, I know that SDL2 supports OpenGL rendering too, so looking back at it, SDL2 wasn’t a bad choice at all (plus I’m still only rendering simple shapes like squares right now).

That said, I like GLFW’s window API better and I need some OpenGL training anyway, so why not start with simple shapes. Next time, I’ll also have a look at [SFML](http://www.sfml-dev.org/){:target="_blank"}, but for now I want to focus on the engine systems (modules).

## Progress

I have implemented the **game application window**, basic **keyboard input** and basic **rendering** systems, as well as a simple **entity-component** system with a base Actor class for game objects, a base Component class for components and their respective **factories**. Input and rendering is done via Components, but the developer can also add custom behavior by subclassing the Actor class for all game, as in Unreal Engine (and Godot with *Nodes*).

**Advantage**: you can implement behavior specific to one entity directly inside the Actor subclass, without using components

**Disadvantage**: all game objects don’t have the same exact type and have different sizes, so you cannot put them in an array/vector of GameObjects (Unity-style) combined with [handles](http://gamesfromwithin.com/managing-data-relationships) for maximum cache efficiency (see [Data Locality](http://gameprogrammingpatterns.com/data-locality.html)). If you still want data contiguity, you’ll need a custom container that supports variable object size.

For now, I have something like this:

![Three red squares drawn on a dark blue background](/assets/pictures/blog/devlog/2019-05-24-c++-2d-game-engine-postmortem/Red-squares.png)

<figcaption>Primitive rendering with Stealth Engine</figcaption>

![A red square controlled by the player is pushing another one](/assets/pictures/blog/devlog/2019-05-24-c++-2d-game-engine-postmortem/Box2D-box-collision-demo.gif)

<figcaption>Demonstration of Box2D collision in Stealth Engine (player controls right square)</figcaption>

The last thing I have done is refactoring the engine structure with a lot of interfaces to allow unit testing.

You can check the code on my GitHub repos:

- [Engine](https://github.com/hsandt/Stealth-Engine/tree/develop)
- [Sample “game”](https://github.com/hsandt/Stealth-Engine-sample-game/tree/develop) (it uses the engine as submodule)

## Next step

I’m not working on this project right now, but I’ll have to go back to it at some point, especially if I want to make an engine in a different language (e.g. Rust). This would be an opportunity to learn from my past mistakes and clean things up before I step onto a cleaner architecture.