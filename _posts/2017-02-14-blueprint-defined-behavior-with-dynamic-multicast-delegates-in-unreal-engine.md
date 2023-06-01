---
layout: post
title:  "Blueprint-defined behavior with dynamic multicast delegates in Unreal Engine"
tag: ue4
thumbnail: "2017-02-14/thumbnail.png"
---

*Note: this post has been moved from my old website. It is about UE4 and has not been tested for UE5, however UE5 documentation shows that delegate macro names have not changed. Content has been adjusted to fix dead links and update links to their redirection, such as UE4 doc -> UE5 doc.*

Quite often, gameplay programmers need to hand over the task of creating scripted events to level designers. In Unreal, a common workflow is to define shared features in C++ and level-specific behaviors with Blueprints.

While it is possible to implement C++ Actor methods via Blueprints using either [`BlueprintImplementableEvent`](https://wiki.unrealengine.com/Blueprints,_Empower_Your_Entire_Team_With_BlueprintImplementableEvent) or `BlueprintNativeEvent`, in this post, I’ll talk about **dynamic multicast delegates**.

# Concept

Delegates allow you to handle functions as objects, pass them around and execute them later with the appropriate context. There are various ways to implement them in C++ (see [this discussion on stack overflow](http://stackoverflow.com/questions/9568150/what-is-a-c-delegate) and [this proposition of Generic C++ delegates](https://nikitablack.github.io/post/generic_c++_delegates/)), and Unreal provides its own implementation (see [Delegates](https://docs.unrealengine.com/5.2/en-US/delegates-and-lamba-functions-in-unreal-engine/) in UE documentation). I won’t try to explain how they work in UE (getting myself lost among all the macros in the source code) but I’ll show you how to use them in a very specific case.

Imagine we have several Actors that share the same behaviors via **Actor Components**. Both Actors and Actor Components are initially defined in C++, but only Actors are extended via Blueprints (to reduce the number of Blueprints).  Behaviors are defined as C++ methods in the Actor Components’ classes, but since those are not derived into Blueprints, we cannot use `BlueprintImplementableEvent` nor `BlueprintNativeEvent` `UFUNCTION`s to move the implementation to a Blueprint event graph.

Instead, we declare a **dynamic multicast delegate member** in the Actor Component (called `SwitchableComponent`) and bind a function (actually a Blueprint graph) to that delegate in the **Actor’s Blueprint**.

# Code

## Actor Component

Below is an example on how to do that with a switch and a delegate for functions that takes 1 boolean parameter (`true` to switch on).

```cpp
// SwitchableComponent.h

#pragma once

#include "Item/InteractableComponent.h"
#include "SwitchableComponent.generated.h"

// This macro will generate a declaration for a delegate that supports functions receiving
// one boolean parameter. Check the documentation for parameter variants.
DECLARE_DYNAMIC_MULTICAST_DELEGATE_OneParam(FSwitchableComponentSwitchSignature, bool, bOn);

// In my game, UInteractableComponent allows interaction from the player character,
// but you can derive directly from UActorComponent instead
UCLASS(BlueprintType, ClassGroup = (Interaction), meta = (BlueprintSpawnableComponent))
class MYGAME_API USwitchableComponent : public UInteractableComponent
{
    GENERATED_BODY()

public:

    USwitchableComponent();

    UPROPERTY(Transient, Category = "State")
    bool bIsOn;

    /** Toggle switch */
    void Switch();

protected:

    // Here is the delegate we'll bind the behavior to in the Actor Blueprint
    /** Callback on switch on / off (passed boolean argument is true if switching on) */
    UPROPERTY(BlueprintAssignable, Category = "Interaction")
    FSwitchableComponentSwitchSignature OnSwitch;

};

// SwitchableComponent.cpp

#include "StairlessTower.h"
#include "SwitchableComponent.h"

USwitchableComponent::USwitchableComponent() : UInteractableComponent()
{
    bIsOn = false;
}

void USwitchableComponent::Switch()
{
    // Toggle
    bIsOn = !bIsOn;

    // The IsBound() check is optional for multi-cast delegates, but let you know if
    // at least one function is bound to the delegate
    if (OnSwitch.IsBound())
    {
        OnSwitch.Broadcast(bIsOn);
    }
}
```

Note that we need a **dynamic** delegate because dynamic delegates are serializable, which allows them to be saved in the Blueprints. I’m not sure why **multicasts** delegates are required, maybe it’s because they support multiple function bindings or because they don’t have return values. Anyway, if you try to use `DECLARE_DYNAMIC_DELEGATE_OneParam` you’ll get the following error: *‘BlueprintAssignable’ is only allowed on multicast delegate properties.*

## Actor

Now, we create a `WallSwitch` Actor that uses `SwitchableComponent`:

```cpp
// WallSwitch.h

#pragma once

#include "GameFramework/Actor.h"
#include "WallSwitch.generated.h"

// We'll need to derive a Blueprint from this Actor, so we make it Blueprintable
UCLASS(Blueprintable)
class MYGAME_API AWallSwitch : public AActor
{
    GENERATED_BODY()

    // Make the switchable component accessible in the Blueprint editor for later
    /** Switchable component */
    UPROPERTY(VisibleAnywhere, BlueprintReadOnly, Category = "Interaction", meta = (AllowPrivateAccess = "true"))
    class USwitchableComponent* SwitchableComponent;

public:
    // Sets default values for this component's properties
    AWallSwitch();

    // Called when the game starts
    virtual void BeginPlay() override;

    // Called every frame
    // virtual void Tick( float DeltaSeconds ) override;

};


// WallSwitch.cpp

#include "StairlessTower.h"
#include "WallSwitch.h"

#include "Item/SwitchableComponent.h"

// Sets default values for this component's properties
AWallSwitch::AWallSwitch()
{
    PrimaryActorTick.bCanEverTick = false;

    // Create and attach a SwitchableComponent
    SwitchableComponent = CreateDefaultSubobject<USwitchableComponent>(TEXT("SwitchableComponent"));
}
```

# Blueprint

## Actor Blueprint

We create an Actor Blueprint `BP_WallSwitch` derived from `WallSwitch`. The Components panel shows:

![WallSwitch Actor blueprint with SwitchableComponent](/assets/pictures/blog/2017-02-14/UE4-delegate-blueprint-BP_WallSwitch-components.png)

When we select the Switchable Component, the Details panel shows:

![Switchable Component details panel with OnSwitch event View button](/assets/pictures/blog/2017-02-14/UE4-delegate-blueprint-BP_WallSwitch-details.png)

## Binding

At first, the buttons in the Events section should all show a “+”. We click on the button next to *On Switch* to create the event node below (from then on, the button will show “View” as on the screenshot above):

![On Switch event, no binding](/assets/pictures/blog/2017-02-14/UE4-delegate-blueprint-BP_WallSwitch-Event-Graph-no-binding.png)

Alternatively, you may right-click in the Event Graph area and type “Add On Switch” in the search field (ensuring SwitchableComponent is still selected and Context Sensitive is checked).

From here, we can bind a Blueprint graph to the OnSwitch delegate (represented by an event node) defined earlier in C++. In this example, we play a Sequence from a Sequence Actor reference we added directly as a Variable in the Actor Blueprint.

![Binding for Switchable Component OnSwitch event on Wall Switch actor](/assets/pictures/blog/2017-02-14/UE4-delegate-blueprint-BP_WallSwitch-Event-Graph.png)

# Result

When the player character tries to interact with the Wall Switch, the level sequence plays:

![Player Character uses Switch to move Wall](/assets/pictures/blog/2017-02-14/UE4-Blueprint-delegates-On-Switch-action.gif)

The red/green box you see is a Box Trace with visual debug that the Player Character uses to detect interactables. It’s quite easy to do with Blueprints but may be tricky in C++, I’ll explain how this works in another post.

# Notes

The OnSwitch event node that appeared seems to be a convenience node provided by the Event Graph when handling a delegate on an Actor Component (BlueprintImplementableEvents also show such nodes). But in general, you can bind events to delegates by creating a Custom Event with its own subgraph and assigning it to the Event input pin of the *Bind Event to …* node (type “Assign” in the Blueprint search box and you’ll find an action that generates both the Custom Event and the Bind Event node for the delegate you want, provided it is accessible from the current Blueprint or you have selected it in the World Viewport).

For instance, I selected a Wall Switch instance in the Viewport, then in the Level Blueprint editor I right-clicked > Assign to OnSwitch. This allowed me to add an extra logging event when the Wall Switch was pressed (the multi-cast delegates will trigger **all** bounds functions/events on Broadcast).

![Level Blueprint binding action to On Switch delegate](/assets/pictures/blog/2017-02-14/UE4-delegate-blueprint-Switch-level-event.png)

For examples on how to bind functions from raw C++, check out [Rama’s article on Delegates](https://unrealcommunity.wiki/delegates-in-ue4-raw-cpp-and-bp-exposed-xifmcmq5).