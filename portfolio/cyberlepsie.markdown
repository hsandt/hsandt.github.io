---
layout: portfolio_item
title: "Cyberlepsie"
subtitle: "Dystopian computer desktop simulation"
categories: video-game school
asset-dir: "Cyberlepsie"
thumbnail: "Cyberlepsie-Thumbnail.jpeg"
banner: "Cyberlepsie banner 720p.webp"
youtube:
  id: IZM2Mxt0d_g
  title: "Cyberlepsie Vidéo gameplay"
screenshots:
  - path: "Cyberlepsie screenshot - Hub overview.webp"
    description: "Cyberlepsie screenshot - Hub overview"
  - path: "Cyberlepsie screenshot - Chat EN 2.webp"
    description: "Cyberlepsie screenshot - Chat in English"
  - path: "Cyberlepsie screenshot - Terminal EN 2.webp"
    description: "Cyberlepsie screenshot - Terminal in English"
  - path: "Cyberlepsie screenshot - Settings EN.webp"
    description: "Cyberlepsie screenshot - Settings in English"
meta:
  school: "Gobelins & Cnam-Enjmin"
  release: "2016"
  platform: "Web"
  genre: "Narrative, Point-and-click, Simulation"
  mode: "1 player"
  play-time: "4 minutes (1 mission)"
  target-audience: "Cyberpunk and computer enthusiasts (14-35)"
  working-period: "Dec 2015 - Feb 2016"
  team: "3 people"
  role: "Story, Game design, Programming"
  technology: "HTML5, Javascript/CoffeeScript, CSS/SASS (without canvas)"
deliverable_links:
  - platform: github
    url: "https://hsandt.github.io/hacker/"
    title: Play in your browser
  - platform: github
    url: "https://github.com/hsandt/hacker/"
    title: Source code on GitHub
---

## Description

Cyberlepsie is an interactive fiction game that takes place in 2027, in a country where most of the information networks are under control of the government. While normal citizens and hackers strive to protect private information, you play as Hannah, a 47-year old computer-enthusiast mother who hacks into servers and sells confidential data to anonymous clients. Hannah uses her money to help her daughter, but soon realizes that her behavior is leading to no good…

During the game, the player discusses with non-player characters and can accept mission orders from them. Once a mission is accepted, the player can use a UNIX-like computer terminal to hack into confidential data and reveal it to her client for money. The current game consists of 1 mission, without money at stake.

## Playing instructions

[Play in your browser](https://hsandt.github.io/hacker/), or install the game to play locally (see instructions on [the GitHub page](https://github.com/hsandt/hacker/)). Playing in the browser is easier but may require a longer loading time depending on your hardware and connection.

We recommending enabling audio to hear ringtones and notification sounds.

### Controls

The game is played with the mouse and the keyboard.

The initial game screen is a hub on which a desktop and several devices are visible. Open the window of any device by clicking on its screen. Close a window by clicking on the cross, clicking outside or pressing ESCAPE.

At the beginning of the game, the smartphone **on the bottom-left of the screen** rings. Click there to start chatting. To fulfill your task: open the terminal window **at the center of the screen**, then type appropriate commands, **pressing ENTER between each**. Type `help` and press ENTER to print available commands.

Open the settings by clicking on the red circle on the right. Choose the language you want for the dialogues, apply and close the window.

## Screenshots

{% include portfolio-item-screenshots.html screenshots=page.screenshots %}

## Context

Cyberlepsie is the 2nd video game I developed during my postgraduate degree at Gobelins. The constraints were to create an interactive story and to use web technologies.

The 1st prototype of the game was created in 1.5 month and presented to the teaching staff. We further worked 1 month to improve the chat system and the UI.

## Team

- Long Nguyen Huu: Story, Game design, Programming, Management
- [Médéric Hénin](https://www.linkedin.com/in/médéric-hénin-41a115a5): Story, Game design, UI programming
- [Thimothée Marnat](https://www.artstation.com/timothemarnat): Story, Game design, Graphics

## Role

### Story

- Participated in world and main story line
- Contributed to mission and dialogue writing
- Finding names for some characters, organizations and places

### System programming

- JS package management with npm and bower
- Asynchronous loading of HTML and JSON content
- Story and dialogue tree system
- Dialogue localization system

### UI programming

- Terminal and chat windows

### Build

- Building project (gulp)
- Publishing to GitHub pages

### Management

- Backlog creation (tasks, bugs, assets, planning)

### Localization

- English dialogues

## Document

The presentation of Cyberlepsie made for the teaching staff is available in French [here](/assets/documents/Cyberlepsie/Cyberlepsie-mini-mémoire.pdf) (copyright of the team).

## Packages

- npm and bower for package management
- jQuery
- Handlebars
- gulp

## Credits

- Web Chat Widget on ByPeople (not available anymore)
- [Nifty Modal Window Effects](https://tympanus.net/codrops/2013/06/25/nifty-modal-window-effects/) by Mary Lou on Codrops
