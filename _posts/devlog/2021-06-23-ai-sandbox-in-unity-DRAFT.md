---
layout: post
title: "AI Sandbox in Unity"
tags: ai
image: "/assets/pictures/blog/devlog/2021-06-23-ai-sandbox-in-unity/thumbnail.png"
thumbnail: "2021-06-23-ai-sandbox-in-unity/thumbnail.png"
published: false
---

*This post is a draft and may undergo changes over time.*

I am sometimes working on an AI sandbox game with Unity. I implement various AI techniques I found in books, using Unity as a basic game framework and without using its advanced features.

I implement AI features in C# from [AI Game Engine Programming](https://www.amazon.com/Game-Engine-Programming-Brian-Schwab/dp/1584505729) (code samples in C++) and [Artificial Intelligence for Games](https://www.amazon.com/Artificial-Intelligence-Games-Ian-Millington/dp/0123747317/ref=dp_ob_title_bk) (pseudocode). Because of the specific features of C# and Unity, I adapt the code as needed while trying to keep the same behavior as described in the books. Sometimes, I am not satisfied with a specific behavior so I have to change the code further.

My project is uses a Git submodule to gather AI scripts that are reusable between games. The submodule repository is available publicly on Bitbucket as [Unity Commons – AI](https://bitbucket.org/hsandt/unity-commons-ai/commits/branch/feature/movement) (branch feature/movement). Note that it is a work in progress, but you can read the code to compare your implementation of the AI techniques with mine.

# Features

## Finite-State Machine

Source: AI Game Engine Programming

Unity implemented Finite-State Machines (FSM) for its Animator, but I recreated my own system for training purpose. It heavily uses generic and is entirely code-based. Currently, it doesn’t support data-driven state programming. For an FSM system that supports transition injection, check out libraries like [solid-state](https://code.google.com/archive/p/solid-state/) (made by another developer).

[add video guard changing state]

## Movement

Source: Artificial Intelligence for Games

I have implemented pseudo-code from the book until Chapter 3.4.2. I have implemented a variety of Steering Movements, which you can see in action below.

[add videos]

I have also implemented some basic ballistic from Chapter 3.5?: Physics Prediction.

Video Player

<video controls class="full-width">
  <source src="/assets/pictures/blog/devlog/2021-06-23-ai-sandbox-in-unity/AI4G Physics Prediction Firing Cannon 1 720p.mp4" type="video/mp4">
</video>
