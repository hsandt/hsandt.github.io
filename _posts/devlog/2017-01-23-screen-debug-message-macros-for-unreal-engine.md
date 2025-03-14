---
layout: post
title:  "Screen Debug Message macros for Unreal Engine"
tags: ue4 c++
image: "/assets/pictures/blog/devlog/2017-01-23/thumbnail.png"
thumbnail: "2017-01-23/thumbnail.png"
---

*Note: this post has been moved from my old website. It is about UE4 and has not been tested for UE5, however UE5 documentation shows that AddOnScreenDebugMessage's signature has not changed. Content has been adjusted to fix dead links and update links to their redirection, such as UE4 doc -> UE5 doc.*

For all my Unreal projects, I insert a small header containing debugging utility, especially for printing on screen.

# Code

First, I defined a bunch of macros to print debug messages on screen. The code is based on [Logs, Printing Messages To Yourself During Runtime](https://unrealcommunity.wiki/logs-printing-messages-to-yourself-during-runtime-n5ifosqc) and uses [AddOnScreenDebugMessage](https://dev.epicgames.com/documentation/en-us/unreal-engine/API/Runtime/Engine/Engine/UEngine/AddOnScreenDebugMessage)

```cpp
#pragma once

#include "EngineGlobals.h"
#include "Engine/Engine.h"

#define print(text)                         if (GEngine) GEngine->AddOnScreenDebugMessage(-1, 1.5f, FColor::White, TEXT(text), false)
#define printc(channel, text)               if (GEngine) GEngine->AddOnScreenDebugMessage(channel, 1.5f, FColor::White, TEXT(text))
#define printf(format, ...)                 if (GEngine) GEngine->AddOnScreenDebugMessage(-1, 1.5f, FColor::White, FString::Printf(TEXT(format), ##__VA_ARGS__), false)
#define printcf(channel, format, ...)       if (GEngine) GEngine->AddOnScreenDebugMessage(channel, 1.5f, FColor::White, FString::Printf(TEXT(format), ##__VA_ARGS__))

#define printwarn(text)                     if (GEngine) GEngine->AddOnScreenDebugMessage(-1, 1.5f, FColor::Yellow, TEXT(text), false)
#define printcwarn(channel, text)           if (GEngine) GEngine->AddOnScreenDebugMessage(channel, 1.5f, FColor::Yellow, TEXT(text))
#define printfwarn(format, ...)             if (GEngine) GEngine->AddOnScreenDebugMessage(-1, 1.5f, FColor::Yellow, FString::Printf(TEXT(format), ##__VA_ARGS__), false)
#define printcfwarn(channel, format, ...)   if (GEngine) GEngine->AddOnScreenDebugMessage(channel, 1.5f, FColor::Yellow, FString::Printf(TEXT(format), ##__VA_ARGS__))

#define printerr(text)                      if (GEngine) GEngine->AddOnScreenDebugMessage(-1, 1.5f, FColor::Red, TEXT(text), false)
#define printcerr(channel, text)            if (GEngine) GEngine->AddOnScreenDebugMessage(channel, 1.5f, FColor::Red, TEXT(text))
#define printferr(format, ...)              if (GEngine) GEngine->AddOnScreenDebugMessage(-1, 1.5f, FColor::Red, FString::Printf(TEXT(format), ##__VA_ARGS__), false)
#define printcferr(channel, format, ...)    if (GEngine) GEngine->AddOnScreenDebugMessage(channel, 1.5f, FColor::Red, FString::Printf(TEXT(format), ##__VA_ARGS__))

#define printfloat(variable)                if (GEngine) GEngine->AddOnScreenDebugMessage(-1, 1.5f, FColor::Cyan, FString::Printf(TEXT(#variable ": %f"), variable), false)
#define printcfloat(channel, variable)      if (GEngine) GEngine->AddOnScreenDebugMessage(channel, 1.5f, FColor::Cyan, FString::Printf(TEXT(#variable ": %f"), variable))

#define printvector(variable)               if (GEngine) GEngine->AddOnScreenDebugMessage(-1, 1.5f, FColor::Green, FString::Printf(TEXT(#variable ": %s"), *variable.ToCompactString()), false)
#define printcvector(channel, variable)     if (GEngine) GEngine->AddOnScreenDebugMessage(channel, 1.5f, FColor::Green, FString::Printf(TEXT(#variable ": %s"), *variable.ToCompactString()))
```

There are multiple versions for each define because I wanted to support channels and string formats.

A message printed on a channel will override any previous message on  the same channel, whereas a message not printed on a channel (-1) will  always be printed as a new message.

String formats are very convenient for debugging, just remember to pass `*TCHAR` arguments to Printf by calling the `operator*` on the FString you want to display (variadic arguments, a float or a  vector converted to a string). Note that I use  FVector::ToCompactString() instead of ToString() to display 2 decimals  instead of 3, but your mileage may vary.

`#variable` allows me to print the name of the  variable or expression in front of its value. The fallback is that you  shouldn’t type expressions that are too long.

In the other defines, the `##` before `__VA_ARGS__` will make sure the last comma will be stripped out of Printf arguments if no argument is passed along a format, although it is not required when using variadic macros in C++ (see [Variadic Macros](https://gcc.gnu.org/onlinedocs/cpp/Variadic-Macros.html)). Since the format version of each method (`printf`, `printcf`, `printfwarn`, etc.) supports 0 extra arguments, you may get rid of the non-format versions (`print`, `printc`, `printwarn`, etc.) and rely entirely on the format versions.

I also pass `false` as the 5th parameter of  AddOnScreenDebugMessage, bNewerOnTop, so that new messages are  printed toward the bottom of the screen. Again, you may prefer the  opposite option (in this case, don’t pass a 5th argument at all, since  the default is true).

# Demo

![UE4 Screen Debug - Actor location](/assets/pictures/blog/devlog/2017-01-23/UE4-Screen-Debug-Actor-location.jpg)

<figcaption>Actor location debug message is continuously updated</figcaption>

![UE4 Screen Debug - Switched view to first person](/assets/pictures/blog/devlog/2017-01-23/UE4-Screen-Debug-Switched-view-to-first-person.jpg)

<figcaption>Debug messages after switching view to first person</figcaption>

![UE4 Screen Debug - Switched view to third person](/assets/pictures/blog/devlog/2017-01-23/UE4-Screen-Debug-Switched-view-to-third-person.jpg)

<figcaption>Debug messages after switching view to third person</figcaption>

# Further

I am still prototyping my new game, but when I enter production I  will probably want to strip out the debugging calls of my non-dev  builds. I will probably add conditional macros such as

```cpp
#if UE_BUILD_DEBUG
    // defines here
    // ...
#else
    // empty defines here
    #define print(text)
    // ...
#endif
```

Also check out [Rama’s post](https://forums.unrealengine.com/showthread.php?57154-New-Wiki-How-to-Get-a-UE4-FString-of-Calling-Class-Function-and-Line-Number-Rama&p=210060&viewfull=1) to prepend the function name and line to the message.