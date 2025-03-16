---
layout: portfolio_item
title: "Unity 2D collider debug view"
subtitle: "Reveal unselected 2D colliders in Unity Editor"
categories: tool unity
asset-dir: "Unity-2D-collider-debug-view"
thumbnail: "EditCollider-Thumbnail-420.webp"
video-fallback-image: "EditCollider-2D-screenshot.webp"
screenshots:
  - path: "EditCollider-Inspector.webp"
    description: "EditBoxCollider2D component in Unity Inspector"
  - path: "EditCollider-2D-screenshot.webp"
    description: "Unity scene in 2D mode with collider view enabled"
  - path: "EditCollider-3D-screenshot.webp"
    description: "Unity scene in 3D mode with collider view enabled"
  - path: "EditCollider-EditEdgeCollider2D.webp"
    description: "EditEdgeCollider2D component allows to edit coordinates and always view the edge"
meta:
  type: "Debug tool"
  engine: "Unity"
  working-period: "Jan 2016 - May 2021"
deliverable_links:
  - platform: github
    url: "https://github.com/hsandt/hyper-unity-commons/tree/develop/Runtime/Debug"
    title: Source code on GitHub
---

## Description

A collection of components and editor scripts that allow the  level designer to see the 2D collider of any object at any time, a  feature not natively available in Unity

## Features

- Always show 2D collider, even when the object is not selected (disable when you want)
- Support rotating and scaling the object or a parent
- Customize the color of the collider lines
- For Edge and Polygon 2D colliders, edit points directly by coordinates (this feature is now native since Unity 5.4)
- Inspector button to Round all coordinates to 1/16 px
- Also works in 3D view (displays the 2D colliders in perspective)

## Screenshots

{% include portfolio-item-screenshots.html screenshots=page.screenshots %}

<figcaption>The "Round all coordinates to 1/16 px" button was added after those screenshots were taken</figcaption>

## Source code

The link above targets the parent directory of the scripts. The individual scripts are:

- [EditBoxCollider2D.cs](https://github.com/hsandt/hyper-unity-commons/tree/develop/Runtime/Debug/EditBoxCollider2D.cs) : show a BoxCollider2D
- [EditEdgeCollider2D.cs](https://github.com/hsandt/hyper-unity-commons/tree/develop/Runtime/Debug/EditEdgeCollider2D.cs) and [EditEdgeColliderEditor.cs](https://github.com/hsandt/hyper-unity-commons/tree/develop/Runtime/Debug/Editor/EditEdgeCollider2DEditor.cs) : show and edit coordinates of an EdgeCollider2D
- [EditPolygonCollider2D.cs](https://github.com/hsandt/hyper-unity-commons/tree/develop/Runtime/Debug/EditPolygonCollider2D.cs) and [EditPolygonColliderEditor.cs](https://github.com/hsandt/hyper-unity-commons/tree/develop/Runtime/Debug/Editor/EditPolygonCollider2DEditor.cs) : show and edit coordinates of a PolygonCollider2D

The scripts depend on [GizmosUtil](https://github.com/hsandt/hyper-unity-commons/tree/develop/Runtime/Helper/Util/GizmosUtil.cs), a helper script I mainly wrote to support the 2D collider debug view.

## Credits

The editing part is based on [Raphael Marques’ answer on Stackoverflow](http://stackoverflow.com/questions/29819697/manually-edit-unity3d-collider-coordinates).
