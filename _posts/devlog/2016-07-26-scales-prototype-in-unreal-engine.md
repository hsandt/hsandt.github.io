---
layout: post
title: "Scales prototype in Unreal Engine"
tags: ue4 blueprints
image: "/assets/pictures/blog/devlog/2016-07-26/thumbnail.png"
thumbnail: "2016-07-26/thumbnail.png"
---

*Note: this post has been moved from my old website. It is about UE4 and has not been tested for UE5, however most functions should be compatible.*

I made a prototype of **giant scales** for a third-person puzzle platformer I am developing with Unreal Engine. They are similar to the scales found in The Legend of Zelda: The Wind Waker in the Tower of the Gods, i.e. the side with the higher total weight goes down and the character has its own height. I worked with Blueprints but I intend to convert them to C++ for the final game.

![TP Unreal - Scale prototype Character and all blocks](/assets/pictures/blog/devlog/2016-07-26/TP-Unreal-Scale-prototype-Character-and-all-blocks.png)

# Blueprints

## Scales

Each scale acts as a platform on which the player character can stand. The scales move vertically depending on the difference of weights between the two scales.

![TP Unreal - Scale prototype Blueprint viewport](/assets/pictures/blog/devlog/2016-07-26/TP-Unreal-Scale-prototype-Blueprint-viewport.png)

## Weight

Each weight is a blueprint that inherits from a base `BP_Weight` class. They have one float parameter, their **mass** (in arbitrary unit), and have specific meshes so we can guess their masses at a glance. The Player character is not a `BP_Weight` itself, but in terms of mass it is equivalent to a tall block.

I wanted to detect weight located on top of a scale, but unfortunately Unreal does not send a specific event when a collider stops touching another (only `OnHit` when a contact starts). I didn’t want to rely on physics either, so I ended up using `OnBeginOverlap` and `OnEndOverlap` with very thin triggers I added on the surface of the platforms. Weights that enter the trigger are considered to be on top of the platform until they exit it. Not very elegant, but does the job.

![TP Unreal - Scale prototype Blueprint platform trigger](/assets/pictures/blog/devlog/2016-07-26/TP-Unreal-Scale-prototype-Blueprint-platform-trigger.png)

I needed to detect the Player character’s weight too, but character blueprints already have their own base class, so instead of using `BP_Weight` I added a manual check for the character (class `ThirdPersonCharacter`). So the blueprint tests for both `BP_Weight` and `ThirdPersonCharacter` in Overlap events.

[![TP Unreal - Scale prototype Blueprint scale overlap](/assets/pictures/blog/devlog/2016-07-26/TP-Unreal-Scale-prototype-Blueprint-scale-overlap.png)

*UPDATE 2025*

The sub-graphs **Attach to Platform** and **Detach to Platform** are not shown here. They register/unregister weights put on a given platform. This is used to compute the weight difference and therefore the height difference in **Update Target Delta Height**, as described below.

## Platform motion

Each time a new weight or the character stands on or leave one of the scales, I update the total mass on top of each scale. Then I compute the difference between the two values and multiply that by some factor to get the delta height of the scales, i.e. their new height relative to their height in the neutral position (the delta height is linear of weight difference).

For a smooth motion, I update the height of each scale gradually by playing a **Timeline** that returns a value between 0 and 1. I use the returned value in a linear interpolation (LERP) between the initial and the target height.

![TP Unreal - Scale prototype Lift Motion Timeline](/assets/pictures/blog/devlog/2016-07-26/TP-Unreal-Scale-prototype-Lift-Motion-Timeline.png)

Note that in Unreal Blueprints, timelines can only appear on the top-level event flow (probably because they rely on the   tick). If you want to play the timeline from inside a method as I did, you have to trigger an event in the method and bind that event to the Timeline node in the event flow.

# Result

A demo of the scales in video:

<video controls loop="loop" class="full-width">
    <source src="/assets/pictures/blog/devlog/2016-07-26/TP-Unreal-Scale-prototype-Demo.mp4">
    Your browser does not support the video tag.
</video>

# Issues and future improvements

An important issue with the Overlap method is that objects standing on top of another object on the platform are not detected. This is also true for the character. Have a look:

![TP Unreal - Scale prototype Character on block bug](/assets/pictures/blog/devlog/2016-07-26/TP-Unreal-Scale-prototype-Character-on-block-bug.png)

The character seems to have no weight since it is not detected by the platform box trigger.

To solve the problem mentioned above, we could either:

- detect objects on top of other objects with multiple trigger overlap tests
- use a completely different approach (still thinking about it)

Also, rather than using a base class `BP_Weight` for all weight objects, I could create an **Actor Component** for more flexibility. The Actor Component could then be added to any actor that should interact with the scales, including the Player character, without affecting its whole structure. Instead of casting objects detected by the scales, I would try to get that component. Note that Unreal Engine also provides Interfaces (not native in C++), but interfaces do not allow to define attributes such as a Mass.

# Further topic

I haven’t talked about the Zelda-like contextual actions Grab and Drop here. I need to improve them, maybe they will be the topic of another post.