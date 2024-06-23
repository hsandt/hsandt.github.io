---
layout: post
title:  "Combat Platformer in Godot 4: April 2024 progress"
tag: godot
image: "/assets/pictures/blog/devlog/2024-04-12/thumbnail.png"
thumbnail: "2024-04-12/thumbnail.png"
---

# Summary

## Visual revamp

Big revamp! I finally switched the whole game to **full custom graphics**. I first worked with a resolution similar to the proto character asset (see [previous post]({% post_url /devlog/2024-01-06-godot-combat-platformer-progress %}) 3 months ago), then tried smaller sizes to draw faster. Below, some character scale research:

![Main character sprite scale research](/assets/pictures/blog/devlog/2024-04-12/paladin_Idle_sword_demo_all_sizes_2024-03-19_@4x.png)

From left to right:

1. **Tiny**: fast to draw, but hard to show details like scars, sword erosion or body limb animations. Instead, it relies a lot on translations and FX.
2. **Chibi**: I don't like how this one turned out, it was supposed to look like [Momodora I-III](https://rdein.itch.io/) but got ugly and now it reminds me of the [horned idol statue](https://mixnmojo.com/galleries/full/full20100912100720.png) in *Indiana Jones and the Fate of Atlantis*.
3. **Small**: It's a nice compromise, I'd go with this one if I had more time.
4. **Normal**: The original sprite I've drawn, would take more time to animate, but I'd go with this one if I hired a pixel artist.
4. **Tall**: A funny experiment with the "thin body - long legs" pixel art style found in indie games like [Superbrothers: Sword & Sworcery EP](https://store.steampowered.com/app/204060/Superbrothers_Sword__Sworcery_EP/).

In the end I went for the Tiny art style, using references such as [Time for Lunch](https://ldjam.com/events/ludum-dare/53/$366108) (PICO-8 game) and [Necrosphere](https://store.steampowered.com/app/607400/Necrosphere/).

Then I converted the other elements (boss, projectiles and FX) and added new elements (background, HUD) to fit in this style. The ice spike FX is very big so it was quite easy to convert (although the warm up animation needed some tuning), while I had to redo the fireball animation from scratch (and also recolored them).

## Rebuilt boss level

I also rebuilt the whole level to something symmetrical with a few platforms. Kudos to the [Lospec Pixel School](https://lospec.com/pixel-school/) which helped me tune the color palette! Using Aseprite, it's quite fast with the Indexed Color Mode + Edit Color button.

## First SFX

Finally, I added fireball spawn SFX. Instead of the usual sfxr (via [jsfxr](https://sfxr.me/)), I tried to use audio synthesizer [Vital](https://vital.audio/). I had already tested its free little brother [Helm](https://tytel.org/helm/) but was limited by the lack of wave modulation and wanted more features... Well, I got them, there are too many for me to understand now, so I just used a little bit of Vital's features.

The biggest issue was [Reaper + Vital plugin crashing on Linux](https://forum.vital.audio/t/vital-crashing-reaper-linux-clap-and-vst3-versions/13540) which forced me to manually record the SFX from Vital standalone. I may eventually switch back to jsfxr or Helm because of this.

Since I was busy working on new graphics and plugging the HUD behavior, there is no new gameplay features in this update. I will work on improved boss patterns and main character moves next time.

<video controls loop="loop">
  <source src="/assets/pictures/blog/devlog/2024-04-12/2024-04-11 Godot Boss - 5 platforms, MC attack vs Fireballs and Ice spikes.webm" type="video/webm">
</video>

# Changelog

## Level

- Rebuilt full level as a small, one-screen room with 5 platforms

## UI

- HUD: plug main character & boss life gauges to their remaining HP

## Visual

- Main character sprites: Idle (1 frame), Run cycle (4 frames), Attack (7 frames)
- Boss sprites (Tiny art style): Idle (1 frame)
- Fireball sprites (Tiny art style): Move (4 frames)
- Ice spikes (Tiny art style): Warm up (13 frames), Appear (6 frames), Active (4 frames), Disappear (3 frames)
- HUD: Main character life gauge (discrete cells), Boss life gauge (continuous gauge)

## Audio

- SFX: Fireball spawn

# Godot threads opened

For the first time, I'll also post the list of Godot issues and proposals I opened since the last devlog. It's pretty long because they span over 3 months, hopefully next list will be shorter.

I realised I spent a considerable amount of time debugging, isolating MWE (Minimum Working Examples) and posting them on GitHub, so tracking issues I have opened is a good way to motivate me: I've not been doing nothing that day!

For now it's my main way to contribute to Godot, but I hope I'll be able to send pull requests to contribute to engine code in the near future.

## Issues

- [#87254 Sometimes after saving scene, both instantiated scene and original scene node numerical properties become null, shown as 0 in inspector](https://github.com/godotengine/godot/issues/87254)
- [#88067 Erratic behavior when CharacterBody2D is inside tilemap (or group of small colliders) with collision shapes, is_on_floor returns false](https://github.com/godotengine/godot/issues/88067)
- [#88115 AnimatedSprite2D: Empty Animation name error on ready/instantiation propagates to inherited scenes](https://github.com/godotengine/godot/issues/88115)
- [#88303 Scene editor: Mouse middle click doesn't always close scene tab](https://github.com/godotengine/godot/issues/88303)
- [#88400 Export: Save a File: Godot doesn't update Quick Access folders if changed after opening editor, causing offset display or even out-of-bounds error](https://github.com/godotengine/godot/issues/88400)
- [#88408 Linux: Scene editor: Control: Releasing mouse primary button after Alt+drag for centered Control resize will not end resize operation](https://github.com/godotengine/godot/issues/88408)
- [#89543 Linux X11 OpenGL/Vulkan - After changing window size, window content doesn't immediately refresh to match new size](https://github.com/godotengine/godot/issues/89543)
- [#89621 Linux - Portable installation of Blender not recognized for Blender import with error: Blender Path does not contain a Blender installation](https://github.com/godotengine/godot/issues/89621)
- [#89785 Autocomplete Input.get_axis StringName parameter suddenly switches from action name to symbols while typing](https://github.com/godotengine/godot/issues/89785)
- [#89910 When Import ETC2 ASTC option is disabled, Remote Debug on Android is still allowed but fails Export with empty error message in Project Run popup](https://github.com/godotengine/godot/issues/89910)
- [#89923 TileSet: Leftover patterns after TileSet atlas source removal causes output error spam "No TileSet atlas source with id N"](https://github.com/godotengine/godot/issues/89923)
- [#90021 Instances of inherited scenes are not updated when changing exported var value on base scene if scene containing them was already open, until editor restart](https://github.com/godotengine/godot/issues/90021)
- [#90264 Literal String as int (or float) cast causes Parser Error "Cannot cast a value of type "String" as "int"." although it works with variable String](https://github.com/godotengine/godot/issues/90264)
- [#90537 Repeated toggle fullscreen increases window size by the window decorations size each time we leave fullscreen](https://github.com/godotengine/godot/issues/90537)

## Discussions

- [#8948 Add a button/option to build and run directly on plugged Android device](https://github.com/godotengine/godot-proposals/discussions/8948)
- [#8958 Confused by CanvasLayer property follow_viewport_enable / follow_viewport_enabled, sounded like follow_camera_enabled but it's the opposite](https://github.com/godotengine/godot-proposals/discussions/8958)
- [#9096 Ctrl+Click to go to definition of method name defined as StringName &"my_method"](https://github.com/godotengine/godot-proposals/discussions/9096)
- [#9396 Add Control child class/node that fits own size to children (maximum bounding box) to be used as intermediate parent under HBoxContainer/VBoxContainer](https://github.com/godotengine/godot-proposals/discussions/9396)
- [#9400 Tilemap tile full rect collision shapes are considered independent, causing Raycast to hit individual tiles inside tilemap](https://github.com/godotengine/godot-proposals/discussions/9400)
- [#9461 Add exception methods to CharacterBody2D to ignore specific collision objects during move_and_slide](https://github.com/godotengine/godot-proposals/discussions/9461)

## Proposals

- [#8854 Hover long editor bell notification text (cut with ellipsis) to see full message and/or allow copying full text with right-click](https://github.com/godotengine/godot-proposals/issues/8854)
- [#8947 Export to Android: improve Invalid package name error message by showing Project name converted to $genname explicitly](https://github.com/godotengine/godot-proposals/issues/8947)
- [#9095 F1 Search Help reused to navigate code: show custom symbols without doc + go to source code of custom class/method (from F1 popup or documentation)](https://github.com/godotengine/godot-proposals/issues/9095)
- [#9102 Debug: Code editor: command to debug content of Object variable under cursor/caret in remote Inspector](https://github.com/godotengine/godot-proposals/issues/9102)
- [#9105 Allow setting Mouse Default Cursor Shape differently when Button is disabled](https://github.com/godotengine/godot-proposals/issues/9105)
- [#9107 Add contextual menu to convert binary resource .res to serialized text .tres (and vice-versa)](https://github.com/godotengine/godot-proposals/issues/9107)
- [#9129 Windows export: Indicate reason for "Invalid file version" and "Invalid product version"](https://github.com/godotengine/godot-proposals/issues/9129)
- [#9146 Project settings: add Debug > GDScript > Warnings parameter to include/exclude specific add-ons](https://github.com/godotengine/godot-proposals/issues/9146)
- [#9307 Add an option to make Wide / Full Rect control anchor presets take Window Stretch Scale project setting into account](https://github.com/godotengine/godot-proposals/issues/9307)
- [#9387 Animation SpriteFrames: do not lose focus when deleting frame](https://github.com/godotengine/godot-proposals/issues/9387)
