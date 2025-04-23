---
layout: portfolio_item
title: "2D Packing Application"
subtitle: "Constrained graph search-based polygon packing application"
categories: app ai
asset-dir: "2D-Packing-Application"
thumbnail: "Packing-app-Thumbnail-420.webp"
video-fallback-image: "Packing-app-Result-Shirts-e1466006198982.webp"
screenshots:
  - path: "app.webp"
    description: "The main app windows, where the user defines input pieces and parameters"
  - path: "plot_domain.webp"
    description: "Debugging the packing of Tangram pieces step by step"
meta:
  school: "Keio University"
  release: "2015"
  type: "App"
  programming-language: "Python"
  libraries: "Tkinter, numpy, Shapely, matplotlib, generateDS"
  ai-fields: "Graph search, Constrained search, 2D geometry, Collision detection"
  working-period: "Nov 2014 - August 2015"
  role: "Algorithm design, Programming"
deliverable_links:
  - platform: bitbucket
    url: "https://bitbucket.org/hsandt/ippy/src/master/"
    title: Source code on BitBucket
---

## Description

This packing application places a set of 2D polygonal shapes into a rectangular container which is made as small as possible for a given computation time.

- **Input:** a set of polygonal pieces (wooden puzzle, game sprite bounding polygons, cloth patterns)
- **Output:** a list of translations and rotations for each piece + the size of the final rectangular container, where the container size has been minimized
- **Real-world application:** testing puzzle solutions, sprite packing in games, cutting patterns in cloth

## Screenshots

{% include portfolio-item-screenshots.html screenshots=page.screenshots %}

## Context

This program was developed as part of my research on Irregular Packing for my Master of Science in Artificial Intelligence at Keio University, Hagiwara Laboratory.

You can download the associated [Master Thesis here](/assets/documents/2D-Packing-Application/Nguyen Huu Long - Master Thesis PDF v1.1.pdf).

## Acknowledgements

- [NestingXML data set](https://www.euro-online.org/websites/esicup/data-sets/#1535972088237-bbcb74e3-b507) on the ESICUP website for various set of pieces in XML to use in benchmarks
