---
layout: portfolio_item
title: "Blue and Red"
subtitle: "4-player action-puzzle game"
categories: video-game prototype
asset-dir: "Blue-and-Red"
thumbnail: "Blue and Red - Banner"
banner: "Blue and Red - Banner"
video-local: "Blue and Red v0.3 4P demo 2015-03-18.mp4"
screenshots:
  - path: "picosonic v6.1 Start Cinematic screenshot.png"
    description: "Game start cinematic with emeralds"
  - path: "picosonic - spin dash v6.0 (no smoke) main frame.png"
    description: "Spin dash"
  - path: "picosonic_showcase.png"
    description: "Loop-the-loop"
  - path: "picosonic v7.0 - try again.gif"
    description: "Try again with Eggman juggling with the emeralds"
meta:
  status: "Prototype"
  platform: "Windows, macOS, Linux, Web"
  genre: "Real-time puzzle"
  mode: "4 players competitive"
  target-audience: "Primary school children (6-12)"
  working-period: "Oct 2013 - Oct 2015"
  team: "2 people"
  role: "Game design, Programming, Art"
  technology: "Unity 4.3 ~ 5"
deliverable_links:
  - platform: github
    url: "https://github.com/hsandt/scavenger-dogs"
    title: Source code on GitHub
---

TODO: GitHub PULL

## Concept

Blue and Red is a **2D partially competitive action-puzzle game for PC**, where up to **4 players** (color circles) must collect metal scraps (color triangles) and then reach a teleporter (green octagon) to escape from the stage as fast as possible. All the players see the entire stage from the top, and they have the power to lower blocks of the same color as their characters’ to progress. However, when blocks of a given color are lowered, all the other blocks are raised.

I made an early concept poster to promote my game project to potential collaborators. It is linked below as a PDF in both English and Japanese, and suggests features not implemented in the current game.

[Blue and Red v1 – Concept Poster (EN + JP)](/assets/pictures/portfolio/Blue-and-Red/Blue%20and%20Red%20-%20Concept%20Sheet.pdf)

## Context

I worked on this game as a hobbyist during my two years of studies at Keio University (Japan). I wanted to apply the concept of dual environment (e.g. Zelda’s blue and red blocks and Mario’s brick blocks and coins exchange roles when a switch is pressed) to a multiplayer game with two, and then four colors.

I republished a new version on [GitHub](https://github.com/hsandt/scavenger-dogs) trying to upgrade it as Scavenger Dogs, but never released it. However you can check the latest code there (and I could make it public because I stripped the Tk2D and Rewired plugins, replacing them with native Tilemap and new Input system of Unity).

### Personal objectives

- Design and program a small game in Unity without spending time on aesthetics
- Implement basic features of top-view tile-based 2D games

## Play the game

Click on the icons below the top video to download or play in the browser. Note the following:

- The WebPlayer version is v0.3, it works with old versions of Firefox and Opera supporting Unity WebPlayer, and starts with a BGM
- The Windows and OSX 64-bit versions are v0.4, they have new graphics and a pause menu

### Playing instructions

#### **Caption**

| ![blue circle](/assets/pictures/portfolio/Blue-and-Red/blue_avatar.png)![red circle](/assets/pictures/portfolio/Blue-and-Red/red_avatar.png) | characters   | ![blue_key](/assets/pictures/portfolio/Blue-and-Red/blue_key.png)![red_key](/assets/pictures/portfolio/Blue-and-Red/red_key.png) | metal scraps (collectible) | ![floor](/assets/pictures/portfolio/Blue-and-Red/floor.png) | floor |
| ------------------------------------------------------------ | ------------ | ------------------------------------------------------------ | -------------------------- | ------------------------------------------------------------ | ----- |
| ![blue_square_locked](/assets/pictures/portfolio/Blue-and-Red/blue_square_locked.png)![red_square_locked](/assets/pictures/portfolio/Blue-and-Red/red_square_locked.png) | color blocks | ![blue_square](/assets/pictures/portfolio/Blue-and-Red/blue_square.png)![red_square](/assets/pictures/portfolio/Blue-and-Red/red_square.png) | color blocks (lowered)     | ![black_square](/assets/pictures/portfolio/Blue-and-Red/black_square.png) | wall  |
| ![teleporter](/assets/pictures/portfolio/Blue-and-Red/warper.png) | teleporter   |                                                              |                            |                                                              |       |

#### **Objective**

Collect all metal scraps and reach the teleporter.

#### **Controls**

There are 4 characters: Blue, Red, Yellow and Green.

Each can move freely in the level and Toggle color blocks, which switches the blocks matching their own colors between the lowered and the raised states. When raises, color blocks cannot be traversed by the characters.

Note that the level is wrapped in both directions in v0.3, but it does not work consistently in v0.4.

In v0.3 and v0.4 (the versions distributed on this page), level doesn’t automatically restart on game end.

**Menu (v0.4+)**

|                       | Keyboard      | Gamepad |
| :-------------------- | :------------ | :------ |
| Open/close Pause menu | ESCAPE        | START   |
| Navigate              | Arrow keys    | R key   |
| Confirm               | SPACE / ENTER |         |

Mouse only works with the Pause menu.

**Character**

|                             | Keyboard P1 (Blue) | Keyboard P2 (Red)     | Keyboard P3 (Yellow) | Keyboard P4 (Green) | Gamepad            |
| :-------------------------- | :----------------- | :-------------------- | :------------------- | :------------------ | :----------------- |
| Move                        | Arrows             | WASD (ZQSD on Azerty) | TFGH                 | IJKL                | Left stick / D-pad |
| Toggle blocks of same color | SPACE              | TAB                   | R key                | U key               | A button           |

## Context

The project started in October 2013 with Unity 4.3, and because the project was very small and at its beginning, I could afford to upgrade the engine several times up to Unity 5. Each time, I ensured I was using the engine’s latest features, Unity 4.5 UI being the new feature that helped me the most with this game.

I showed the v0.3 of the game at my University festival in Japan, which can be seen in the demo footage above.

For v0.4, I decided to add some graphics to show that the characters are actually walking dogs, but they remained prototype art. There are a few unstable versions above with more features, the main improvement being the addition of controls with the gamepad.

I have stopped working on the game since I have started studying at Gobelins, but during its development I came up with a few programming patterns I am still using quite often.

ADDED: I presented it at Keio festival

##  Team

- Long Nguyen Huu: Game Design, Programming
- *gma* (nickname of a Japanese student): Music

## **Role **

#### Game Design

- Mechanics, rules, controls
- UI design

#### Programming

- Basic 2D top-view character motion with Unity animator
- Gamepad controls with Rewired for Unity
- Item interaction
- Tile objects receiving C# events
- Pause, resume and reset functions of all dynamic objects in the scene
- Pause menu with Unity UI
- Integration of sprite animations
- Versioning on Git, using submodules for reusable scripts I wrote for this game or for other games
- On-screen debug
- Integration tests

#### Management / Communication

- Definition of assets and scene hierarchy and naming conventions
- Finding people to work with, requesting assets and sending builds
- Track tasks and bugs on Google Sheets and BitBucket bugtracker
- Showing the game at events

## Detailed information

More information on gameplay and ambiance are available below. You can also find detailed information in the GDD linked below, which has been partially translated to Japanese. Some parts are missing but the core gameplay has been defined in this document.

### Gameplay

#### Rules

The game starts with blocks of some colors lowered. All players must gather all the metal scraps having the same color as their characters (in v0.6, also bring them to their container) before reaching the level’s teleporter.

The game ends when all the characters have teleported and the 1st player to teleport has the highest score.

#### Level

In Blue and Red, there are up to 4 players and each player controls a dog robot who must evade from a maze, a dynamic tile-based level. Each character is assigned a color and has the power to raise or lower blocks of the same color to slow down their opponents or to progress in the maze. The maze consists of those colored blocks called “switch blocks”, as well as normal blocks that never lower.

![blue_square_locked](/assets/pictures/portfolio/Blue-and-Red/blue_square_locked.png)->![blue_square](/assets/pictures/portfolio/Blue-and-Red/blue_square.png)switch block

![black_square](/assets/pictures/portfolio/Blue-and-Red/black_square.png) permanent wall

At any time during the game, one of the 4 colors is active. All the switch blocks that have the same color as the active color are lowered, and other switch blocks are raised. This means that 1/4 of the colored walls are walkable at any time, so the movements of the characters are quite restricted.

####

#### Controls

Keyboard: Arrow keys, WASD, etc.

Gamepad: stick or + pad

In v0.6, it is also possible to grab and throw items in 2.5D (similarly to Zelda: Link’s Awakening or Golden Sun).

Video Player

<video class="wp-video-shortcode" id="video-1291-2_html5" width="1280" height="720" preload="metadata" src="http://longnguyenhuu.com/wp-content/uploads/2015/11/Blue-and-Red-v0.6-short-run.mp4?_=2" style="box-sizing: border-box; font-family: Helvetica, Arial; max-width: 100%; display: inline-block; width: 800px; height: 450px;"></video>

00:00

00:25

*Grabbing and throwing items*

### Interface

#### Joining phase

Each player can press START once to join the party, and press START again to confirm they are ready. When all players are ready, any player should press ENTER on the keyboard to start the game.

#### Pause menu

The pause menu is a classic Resume – Restart – Exit menu, but I implemented a System Manager referring all dynamic objects in the scene. This way, the motions, animations, interactions and sounds can be paused and resumed, and the state of each object can be reset at any time.

Video Player

<video class="wp-video-shortcode" id="video-1291-3_html5" width="1280" height="360" preload="metadata" src="http://longnguyenhuu.com/wp-content/uploads/2015/11/Blue-and-Red-v0.4-Pause-and-Restart-demo.mp4?_=3" style="box-sizing: border-box; font-family: Helvetica, Arial; max-width: 100%; display: inline-block; width: 800px; height: 450px;"></video>

00:00

00:13

*Pause menu Resume and Restart*



#### On-screen debug

Inspired by Unreal Engine’s on-screen debug print, I made a small utility to print message and variables on-screen in Unity, either in the editor or while playing the built game.

Video Player

<video class="wp-video-shortcode" id="video-1291-4_html5" width="1024" height="768" preload="metadata" src="http://longnguyenhuu.com/wp-content/uploads/2015/11/Blue-and-Red-Debug-OnScreen-warp.mp4?_=4" style="box-sizing: border-box; font-family: Helvetica, Arial; max-width: 100%; display: inline-block; width: 800px; height: 600px;"></video>

00:00

00:11

### Graphics

I have yet to find an artist for this game but I have drawn a few concept arts for the characters and the environment. I consider making the graphics in pixel art by myself for a future version of the game.

#### Concept arts

Although advanced graphics did not make it into the game, the concept arts helped me to define which kind of tiles and interactions I wanted in the game.

[![Blue and Red Environment Concept Art](/assets/pictures/portfolio/Blue-and-Red/ConceptArt_Env_01_basement_corner-203x300.jpg)](http://testportfolio.huulong.webfactional.com/wp-content/uploads/2015/11/ConceptArt_Env_01_basement_corner.jpg)

Blue and Red Environment Concept Art

[![ConceptArt_Char_01_blue_robot](/assets/pictures/portfolio/Blue-and-Red/ConceptArt_Char_01_blue_robot-300x223.jpg)](http://testportfolio.huulong.webfactional.com/wp-content/uploads/2015/11/ConceptArt_Char_01_blue_robot.jpg)

Dog robot character concept art

### Audio

A Japanese student, *gma*, provided me with audio assets for this game.

### Documentation

Below, you will find a few design documents that you can read if you are interested in the workflow and documentation I built to work with few people.

[Blue and Red – Game Design Document 仕様書](http://longnguyenhuu.com/wp-content/uploads/2016/02/Game-Design-Document-仕様書.pdf) (Game Design and Technical Documentation)
[References – 参考 (PDF)](http://longnguyenhuu.com/wp-content/uploads/2016/02/References-参考.pdf) (disclaimer: a compilation of references including copyrighted content for demonstration purpose, can be removed on demand)
