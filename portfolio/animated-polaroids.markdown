---
layout: portfolio_item
title: "Animated polaroids"
subtitle: "Social IoT video jukebox"
categories: app entertainment mixed-media
asset-dir: "Animated-Polaroids"
thumbnail: "Animated-polaroids-Thumbnail-420.jpeg"
video-local: "Polaroid-Movie-768x1024-no-audio-1.mp4"
screenshots:
  - path: "Animated-polaroids-Full-view.jpg"
    description: "Animated polaroids - Full view"
  - path: "Animated-polaroids-Demo-1.jpg"
    description: "Animated polaroids - Demo 1"
  - path: "Animated-polaroids-Demo-2.jpg"
    description: "Animated polaroids - Demo 2"
  - path: "Animated-polaroids-All-pieces.jpg"
    description: "Animated polaroids - All pieces"
  - path: "Animated-polaroids-Circuit-overview.jpg"
    description: "Animated polaroids - Circuit overview"
  - path: "Animated-polaroids-PC-debug.jpg"
    description: "Animated polaroids - PC debug"
meta:
  school: "Gobelins & Cnam-Enjmin"
  type: "App"
  programming-language: "Python, C"
  libraries: "OpenCV"
  materials: "MDF"
  hardware: "PC, Arduino, NFC reader, photoresistors, monitor"
  working-period: "Jan - Feb 2016"
  team: "~60 people"
  role: "Programming"
deliverable_links:
  - platform: github
    url: "https://github.com/hsandt/polaroid-movie"
    title: Source code on GitHub
---

## Description

**Animated polaroids** is an Internet of Things (IoT) project for which we built a device that plays videos matching polaroid photographs. The device’s interface consists of 2 panels:

- as **input**, the polaroid panel: a physical grid where the user can put one polaroid photograph on each cell
- as **output**, the movie panel: a monitor that shows a digital grid of movie clips that loop over 12 seconds

Every time the user adds or removes a photograph from the polaroid panel, a short clip corresponding to the photograph is played or stopped on the corresponding cell.

## Photos

{% include portfolio-item-screenshots.html screenshots=page.screenshots %}

## Context

Animated polaroids is my 4th project at Gobelins, and part of the postgraduate programme on video games and transmedia. Each year, the objective of the project is to create an Internet of Things device for a client.

In 2016, the client was photographic agency Big Shot – Polanimation represented by Emmanuel Perret (since 2020, Big Shot Paris was reborn as [Sajin Photo](https://sajin.fr/)), and the requirement was to design a device that makes use of polaroids for special event photography. We decided to create a device that would allow people to interact through their own pictures and encourage them to speak to other attendees in real life.

We themed the device according to the French Open / Roland-Garros tennis tournament, featuring tennis rackets in the videos and covering the space between photo slots with synthetic grass.

## Team

- Mehdi Tebib: Panel creation, Electronics hardware, Communication
- [Magali Monné](http://www.magalimonne.com/): Panel creation, Graphic design, Communication
- Guillaume Raimbault: Electronics
- Long Nguyen Huu: Programming

### Role

- PC – Arduino serial interface programming (Python)
- Sensor state handling in Arduino (C programming)
