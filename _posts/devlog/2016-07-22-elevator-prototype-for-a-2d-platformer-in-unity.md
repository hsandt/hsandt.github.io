---
layout: post
title: "Elevator prototype for a 2D platformer in Unity"
tags: unity level
image: "/assets/pictures/blog/devlog/2016-07-22-elevator-prototype-for-a-2d-platformer-in-unity/thumbnail.webp"
thumbnail: "2016-07-22-elevator-prototype-for-a-2d-platformer-in-unity/thumbnail.webp"
---

*Note: this post has been moved from my old website. It was written for Unity 5.*

I implemented crawling for my human character controller in a cooperative platformer made with Unity, Mars 21.

I prototyped an elevator for [a cooperative platform game I am working on](/portfolio/mars-21/) with Unity (actually for the v2). I made two prefabs: one for the elevator and one for the switch that controls it.

## Elevator

The Elevator prefab has the following hierarchy:

- Elevator (root)
  - Cage
    - Doors
    - Box

The Elevator root represents the global position of the elevator in  the level, and does not move. Only the Cage can move: vertically from  one level to another.

The Box is the static part of the Cage and the Doors are the moving parts. Watch the video below to see how the elevator works:

<video controls>
  <source src="/assets/pictures/blog/devlog/2016-07-22-elevator-prototype-for-a-2d-platformer-in-unity/Mars-21-Elevator-proto.webm" type="video/webm">
  Your browser does not support the video tag.
</video>

The Elevator is a finite-state machine with 4 states: Idle, Before  Moving, Moving and After Moving. Before and After Moving states are  transitional states that allow the Doors to close and open. For more  flexibility, I decided to code the motion of the Cage rather than create a predefined animation. This way, I will be able to create elevators  with more than 2 floor levels and even different trajectories in the  future.

The elevator moves from one level to the other following the `SmoothStep` function:

```cs
Vector3 position = Vector3.Lerp(elevator.lastPosition, elevator.targetPosition, Mathf.SmoothStep(0, 1, t));
```

The Cage is also an FSM with 4 states: Opened, Close Doors, Closed  and Open Doors. It is based on Unity Animator and this time, door  animations are predefined Unity animations.

## Switch

The Switch detects nearby characters and allow them to interact under specific conditions. When triggered, the elevator cage will move to the next level.

There were already a few interactive elements in the level, so I  refactored their scripts to get a very generic interactable base class.  All interactable scripts now inherit from this base class and must  override 2 abstract methods:

- a predicate method that determines the conditions of interaction (e.g. elevator cage is not already moving)
- a method that determines the effect triggered by the interaction (e.g. move the elevator cage)

Finally, I use C# event handlers to trigger the said effect when the  player presses the contextual action button, provided the conditions are met.