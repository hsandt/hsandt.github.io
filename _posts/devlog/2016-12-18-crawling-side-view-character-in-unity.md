---
layout: post
title: "Crawling side-view character in Unity"
tags: unity character
image: "/assets/pictures/blog/devlog/2016-12-18/thumbnail.png"
thumbnail: "2016-12-18/thumbnail.png"
---

*Note: this post has been moved from my old website. It was written for Unity 5 but Animation Controller has not changed much since.*

I implemented crawling for my human character controller in a cooperative platformer made with Unity, Mars 21.

![Astronaut crawling](/assets/pictures/blog/devlog/2016-12-18/Mars-21-v2-crawling.gif)

<figcaption>Astronaut crawling</figcaption>

# Structure

The controller works with two MonoBehaviour scripts, `AstronautPlayerControl.cs` and `AstronautMotor.cs`, and an Animator component. The Animator Controller has 2 layers:

## Motion layer for logic

The Motion Layer represents the character’s finite-state machine (FSM). A StateBehaviour containing the actual motion logic is added to each state, and all the transitions are immediate (transition time = 0). Below, you can see graph of the sub-state machine “Grounded”, with the grounded sub-states: Idle, Walk (hidden on the right), Turn 180 (for animated 180° turns), Crouched, Crawl and Idle-Crouch transition states.

![Astronaut Animator Motion Layer Crawl](/assets/pictures/blog/devlog/2016-12-18/Mars-21-v2-character-animator-motion-layer.png)

<figcaption>Motion Layer</figcaption>

The Crouched and Crawl state logic is pretty simple. Both StateBehaviours contain the following:

```cs
override public void OnStateUpdate(Animator animator, AnimatorStateInfo stateInfo, int layerIndex) {
    if (!motor.isGrounded) {
        motor.Fall();  // enter Fall state (apply gravity + fall animation)
        return;
    }
    if (!control.continueCrouchIntention) {  // is the player still holding D-pad / stick down?
        motor.StopCrouching();
        return;
    }
    motor.MoveCrawling(control.moveIntentionVector.x);
}
```

where control is an `AstronautPlayerControl` and motor is an `AstronautMotor`. `MoveCrawling()` moves the character by setting his velocity as it would with a normal walking 2D character, with 3 main differences:

- the character preserves his current direction when moving backward (he does not turn)
- the motion velocity is lower, and even lower when moving backward
- the character starts crawling after any motion in the Crouched state (à la Metal Gear Solid), although this difference is merely visual

On the video, the character switches between Idle, IdleToCrouched, Crouched, Crawl and CrouchedToIdle. The transitions between IdleToCrouched and CrouchedToIdle allow the character to quickly interrupt crouching to stand up again smoothly and vice-versa.

## Animation Layer for aesthetics

The Animation Layer animates the character model. An animation is attached to each state, and the transitions have short durations (0.1s).

![Astronaut Animator Animation Layer Crawl](/assets/pictures/blog/devlog/2016-12-18/Mars-21-v2-character-animator-animation-layer.png)

<figcaption>Animation Layer</figcaption>

Animations have been downloaded from [mixamo](https://www.mixamo.com/) after uploading the character model of the Astronaut.

# Limitations

This approach has an important drawback: you have to duplicate the structure of the FSM between the two layers. Unity has a feature called *Animation layer syncing* which allows you to reuse an existing structure on multiple layers, but unfortunately it doesn’t support using different transition times on different layers (0 for the Motion layer and 0.1s for the Animation layer). For my next project, I will probably switch to an FSM completely in code (with my own StateMachine class), only using the Animator for actual animations.
