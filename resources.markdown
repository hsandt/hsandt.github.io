---
layout: page
title: "Resources"
permalink: /Resources/
---

## Books

Here are some books on Game Design, Game Programming and related field that I have read or that I am reading.

### Game Design

[![The Art of Game Design 2nd edition](/assets/pictures/resources/The Art of Game Design 2nd edition - Cover.webp){: class="left" }](https://www.amazon.com/The-Art-Game-Design-Edition/dp/1466598646/){:target="_blank"}

#### [The Art of Game Design](https://www.amazon.com/The-Art-Game-Design-Edition/dp/1466598646/){:target="_blank"}

by Jesse Schell (2nd edition 2014)

- An introduction to game design for board games, video games, outside experiences, etc.
- An overview of technical, artistic, business and human aspects
- 100 broad objectives to keep in mind when designing a game. Pick up a specialized book on each topic to dig further.

[![Challenges for Game Designers - Cover](/assets/pictures/resources/Challenges for Game Designers - Cover.webp){: class="left" }](https://www.amazon.com/Challenges-Games-Designers-Non-Digital-Exercises/dp/1542453313/){:target="_blank"}

#### [Challenges for Game Designers: non-digital exercises for video game designers](https://www.amazon.com/Challenges-Games-Designers-Non-Digital-Exercises/dp/1542453313/){:target="_blank"}

by Brenda Brathwaite, Ian Schreiber (2008)

- A collection of exercises grouped by topic: Balancing, Working on a sequel, UI design, etc.
- Each topic is introduced with basic concepts and a few tips, but the gist is in the challenges
- Online course started in 2009 to follow in parallel to the book ([archives here](https://gamedesignconcepts.wordpress.com/){:target="_blank"})
- Easy to read, hard to finish the challenges. I recommend to start by picking one from each chapter.

### Level Design

[![An Architectural Approach to Level Design - Cover](/assets/pictures/resources/An Architectural Approach to Level Design - Cover.webp){: class="left" }](https://www.amazon.com/Architectural-Approach-Level-Design/dp/1466585412/){:target="_blank"}

#### [An Architectural Approach to Level Design](https://www.amazon.com/Architectural-Approach-Level-Design/dp/1466585412/){:target="_blank"}

by Christopher W. Totten (1st edition 2014)

- Level design principles for 2D and 3D, inspired by techniques used in famous cities and buildings
- How to use geometry, content and aesthetics to teach players new mechanics, entice them with rewards, tell stories and gather communities
- [Excerpts here](https://www.gamedeveloper.com/design/excerpts-from-an-architectural-approach-to-level-design){:target="_blank"} and [a retake on survival instincts here](https://www.gamedeveloper.com/design/designing-better-levels-through-human-survival-instincts){:target="_blank"}

[![Ultimate Game Design Building Worlds - Cover](/assets/pictures/resources/Ultimate Game Design Building Worlds - Cover.webp){: class="left" }](http://www.amazon.com/Ultimate-Game-Design-Building-Worlds/dp/0072228997/){:target="_blank"}

#### [Ultimate Game Design: Building Game Worlds](http://www.amazon.com/Ultimate-Game-Design-Building-Worlds/dp/0072228997/){:target="_blank"}

by Tom Meigs (2003)

- Describes level building process, from previsualization (sketching, blocking) to production
- Focus on 3D, without targeting a specific engine
- Technical and hands-on tasks on both paper and computer

### Game Feel

[![Game Feel - Cover](/assets/pictures/resources/Game Feel - Cover.webp){: class="left" }](https://www.amazon.com/Game-Feel-Designers-Sensation-Kaufmann/dp/0123743281)

#### [Game Feel: A Game Designer’s Guide to Virtual Sensation](https://www.amazon.com/Game-Feel-Designers-Sensation-Kaufmann/dp/0123743281)

by Steve Swink (2008)

- Opens a new field across HMI and game design
- 1st part describes the cycle between player and machine: player perception, decision, action and machine input processing, computation, rendering.
- 2nd part studies the different elements that constitutes game feel with examples of games
- 3rd part analyses specific action games, detailing their mechanics and controls, and how they impact the player’s perception
- Provides you techniques to assess and sometimes measure “game feel” in a rational manner

### Programming

[![Game Engine Architecture Cover](/assets/pictures/resources/Game Engine Architecture - Cover.webp){: class="left" }](http://www.gameenginebook.com/){:target="_blank"}

#### [Game Engine Architecture](http://www.gameenginebook.com/){:target="_blank"}

by Jason Gregory (2nd edition 2014)

- Engine architecture overview
- Engine systems (input, rendering, etc.) and different propositions of structures
- Short C++ code samples
- C++11 features
- Miscellaneous optimization techniques used in game engines (mostly specific to C++)

![Working Effectively with Legacy Code Cover](/assets/pictures/resources/Working Effectively with Legacy Code - Cover.webp){: class="left" }

#### [Working Effectively with Legacy Code](http://wiki.c2.com/?WorkingEffectivelyWithLegacyCode)

by Michael C. Feathers (2004)

- How to add features and fix bugs in an existing codebase with many unknowns, by refactoring the code to ensure relative safety
- A good part of the book is about writing unit tests, because they are at the same time a tool to verify program behavior and an incentive to refactor the code properly
- In 1st part, each chapter studies a specific case of working with legacy code (My code has side effects, My class is too big, etc.)
- In 2nd part, each section presents a refactoring technique

### Artificial Intelligence

[![AI Game Engine Programming - Cover](/assets/pictures/resources/AI Game Engine Programming - Cover.webp){: class="left" }](https://www.amazon.com/Game-Engine-Programming-Brian-Schwab/dp/1584505729)

#### [AI Game Engine Programming](https://www.amazon.com/Game-Engine-Programming-Brian-Schwab/dp/1584505729)

by Brian Schwab (2nd edition 2008)

- The first part (40% of the book) is about the types of AI techniques used in each main game genre
- The second part (59%) describes the said techniques
  - FSM, Messaging, Location, Steering, Combination, Genetic Algorithms, Neural Networks, Distributed AI
  - Each chapter introduces a new AI technique, its pros and cons, and bits of C++ code.
  - The CD provides full source code, but for Windows only and projects are based on Visual Studio 2008. You’ll need to find equivalents for `<windows.h>` functions and adapt your build system to compile on Unix platforms. I’d recommend to implement the techniques by yourself and use the source code as a reference anyway, although I found myself copy-pasting a lot of boilerplate and glue code too.
- The last part (1%) introduces common issues and debugging techniques.
- A bit tedious to follow while coding. The funky dialogue lines in examples are a bit distracting and C++ makes simple concepts look more complicated. For starters, I'd recommend learning AI with a scripting language like Python (for writing speed) or an intermediate language like C# (for static typing without the fuss).

[![Artificial Intelligence for Games 2nd edition - Cover](/assets/pictures/resources/Artificial Intelligence for Games 2nd edition - Cover.webp){: class="left" }](https://www.amazon.com/Artificial-Intelligence-Games-Ian-Millington/dp/0123747317/){:target="_blank"}

#### [Artificial Intelligence for Games](https://www.amazon.com/Artificial-Intelligence-Games-Ian-Millington/dp/0123747317/){:target="_blank"}

by Ian Millington and John Funge (2nd edition 2009)

- A very high number of AI techniques with concept, pseudo-code, rationale and limitations
  - Techniques: Movement, Pathfinding, Decision Making, Strategy, Learning, Adversarial Search
  - Support: Scheduling, World Interfacing, Content Creation
  - Each technique is detailed with many variants, but the drawback is that implementing each technique you read requires a lot of time, while you will only need a few for a game
- Last short part on AI design
- Pseudo-code is thoroughly explained, commented, and clean
  - Pseudo-code itself allows you to completely implement most of the techniques in your language and framework of choice, but you will need more or less glue code (I am implementing in C# for Unity, relying on physics and mixing MonoBehaviours and pure classes)
  - For some techniques, you’ll realize that important components are missing. Some can be implemented on the spot, others require you to wait for later chapters.
  - Many behavior variants are explained but no pseudo-code is given, so you will frequently need to reuse previous components in different ways, which is also a good exercise (e.g. for Flocking)
  - I spotted many small errors in the pseudo-code though, and I fixed them myself based on the explanations
- Overall a very good reference book for implementing a library of AI techniques, but expect results over the long term.

### Storytelling

[![The Anatomy of Story - Cover](/assets/pictures/resources/The Anatomy of Story - Cover.webp){: class="left" }](https://www.amazon.com/Anatomy-Story-Becoming-Master-Storyteller/dp/0865479933)

#### [The Anatomy of Story](https://www.amazon.com/Anatomy-Story-Becoming-Master-Storyteller/dp/0865479933)

by John Truby (2008)

- Top-down approach to writing scenarios for novels and movies. Applicable to other media, but you will need more specific materials for non-linear stories.
- Focused on long dramatic stories, one-shot or episodic. Some explanations about the specific place of comedy, satire and action stories and how to deal with them.
- Splits the evolution of the story and its characters into key steps
- Chapters deal with: Concept, Character, Moral Argument, World, Symbols, Plot, Scene, Dialogues. They follow the suggested order in which you should build your story, from concept to details. In this process, the world is entirely built around the characters.
- You need to find a balance between sticking to the patterns to make a “story that works” and disrupt them to innovate and fit your own story
