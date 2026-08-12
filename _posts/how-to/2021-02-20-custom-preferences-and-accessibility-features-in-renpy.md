---
layout: post
title:  "Custom Preferences and Accessibility features in Ren’Py"
tags: accessibility renpy ui
image: "/assets/pictures/blog/how-to/2021-02-20-custom-preferences-and-accessibility-features-in-renpy/thumbnail.png"
thumbnail: "2021-02-20-custom-preferences-and-accessibility-features-in-renpy/thumbnail.png"
---

*Note: this post has been moved from my old website. The example game was developed with Renpy v7.3.5. However, I upgraded the game to Renpy v8.4.1 and verified that the additional features were still working with minimal changes (changed some xanchor -> xalign in screens.rpy to fix conflicting properties, which you won't even have to do on a brand new project).*

I rarely have time to make a nice options screen during game jams, not to mention accessibility features. But for [NaNoRenO 2020](https://itch.io/jam/nanoreno-2020), I worked on them more than usual. In this post, I’ll explain how I customized the Preferences and Accessibility panel of [Sidetracked!](https://komehara.itch.io/sidetracked) in [Ren’Py](https://www.renpy.org/).

# Preferences

![Player Character uses Switch to move Wall](/assets/pictures/blog/how-to/2021-02-20-custom-preferences-and-accessibility-features-in-renpy/2020-05-19-v3_005.png)

<figcaption>Preferences panel in <i>Sidetracked!</i></figcaption>

In this game, the Preferences button is always present in the bottom-right corner (gear icon), so it’s not visible in the left side bar to avoid redundancy. I’m not sure if it was the right idea as the Preferences and Accessibility buttons are now far apart from each other, but at least the Preferences button stays at the same place.

## Default Menu

When opening the menu in-game (by pressing Escape or right-clicking), Ren’Py shows the **Save screen** by default. Some players prefer accessing the **Preferences** screen first, then click on Save/Load when needed. Considering that the Save and Load screen are very similar, requiring the player to click on Save or Load to access the respective menus may remove some ambiguity.

I still wanted to preserve the original behavior, so I added a Default Menu option that can be set to either *Preferences* or *Save*. Unfortunately, it’s not easy to change the way Ren’Py opens the game menu natively, so I had to rebind the game menu key to a custom Action.

**Initialization code**

```python
# options.rpy, or any script where you initialize variables and set preferences
# default screen shown when opening in-game menu
default preferences.game_menu_screen = "preferences_screen"
init -110 python:
    def show_pref_game_menu():
        ShowMenu(preferences.game_menu_screen)()
define config.game_menu_action = show_pref_game_menu
```

Source: [options.rpy](https://github.com/hsandt/nanoreno2020-sidetracked/blob/v3.5.3/game/options.rpy#L280)

**Setting**

```python
# screens.rpy (add the vbox where it seems fit)
screen preferences():
    use game_menu(_("Preferences"), scroll="viewport"):
        # ...
        vbox:
            style_prefix "radio"
            label _("Default menu")
            null height 5
            textbutton _("Preferences") action SetField(preferences, "game_menu_screen", "preferences_screen")
            textbutton _("Save") action SetField(preferences, "game_menu_screen", "save_screen")
```

Source: [screens.rpy](https://github.com/hsandt/nanoreno2020-sidetracked/blob/v3.5.3/game/screens.rpy#L856)

**Result**

![Player Character uses Switch to move Wall](/assets/pictures/blog/how-to/2021-02-20-custom-preferences-and-accessibility-features-in-renpy/2020-05-19-v3_007.png)

## Safe Mode

Safe Mode is a joke particular to this game, so I won’t tackle it here. If you’re interested in how it’s done, check the [menu item](https://github.com/hsandt/nanoreno2020-sidetracked/blob/v3.5.3/game/screens.rpy#L863) and [Captcha screen](https://github.com/hsandt/nanoreno2020-sidetracked/blob/v3.5.3/game/screens.rpy#L1833), but you should play the game first to understand what it’s about.

## Slider Reset button

I noticed that the built-in Accessibility panel (toggled with the A key) had convenient reset buttons for the Text Size Scaling and Line Spacing Scaling settings.

![Player Character uses Switch to move Wall](/assets/pictures/blog/how-to/2021-02-20-custom-preferences-and-accessibility-features-in-renpy/Accessibility-built-in-panel-720p-1024x576.png)

<figcaption>Ren’Py built-in Accessibility Panel</figcaption>

I decided to put the same buttons for the Text Speed and Auto-Forward Time sliders:

**Setting**

```python
# screens.rpy
screen preferences():
    # ...
    hbox:
        style_prefix "slider"
        box_wrap True
        vbox:
            label _("Text Speed")
            hbox:
                bar value Preference("text speed")
                # reset to default value of preferences.text_cps in options.rpy
                textbutton _("Reset"):
                    action Preference("text speed", 0)
            null height gui.pref_spacing
            label _("Auto-Forward Time")
            hbox:
                bar value Preference("auto-forward time")
                # reset to default value of preferences.afm_time in options.rpy
                textbutton _("Reset"):
                    action Preference("auto-forward time", 15)
```

Source: [screens.rpy](https://github.com/hsandt/nanoreno2020-sidetracked/blob/v3.5.3/game/screens.rpy#L883)

**Result**

![Player Character uses Switch to move Wall](/assets/pictures/blog/how-to/2021-02-20-custom-preferences-and-accessibility-features-in-renpy/2020-05-19-v3.png)

If you don’t like hard-coded values, define some `config.default_text_cps` and `config.default_afm_time` values in options.rpy, then replace 0 and 15 with those respective values in both screens.rpy above, and in options.rpy:

```python
# options.rpy
default preferences.text_cps = config.default_text_cps
default preferences.afm_time = config.default_afm_time
```

Note that the `Preference` action, like `SetField`, detects if the current value is the target value (see [`SetField.get_selected source`](https://github.com/renpy/renpy/blob/7.3.5.606/renpy/common/00action_data.rpy#L78)). This means that the Reset button is stylized differently when the current value is not default. To tweak this, check your `style_prefix` and define the properties you want for default, selected, and hover states.

Ex:

```python
# screens.rpy
style slider_button_text:
    properties gui.button_text_properties("slider_button")
    outlines [ (absolute(1), "#ffffff00", absolute(0), absolute(0)) ]
    selected_outlines [ (absolute(1), "#744675", absolute(0), absolute(0)) ]
    selected_hover_outlines [ (absolute(1), "#f4cfe5", absolute(0), absolute(0)) ]
    selected_hover_color "#ffffff"
    hover_color "#f4cfe5"
    hover_outlines [ (absolute(1), "#744675", absolute(0), absolute(0)) ]
```

Source: [screens.rpy](https://github.com/hsandt/nanoreno2020-sidetracked/blob/v3.5.3/game/screens.rpy#L1024)

# Accessibility

![Player Character uses Switch to move Wall](/assets/pictures/blog/how-to/2021-02-20-custom-preferences-and-accessibility-features-in-renpy/2020-05-19-v3_002.png)

<figcaption>Accessibility panel in <i>Sidetracked!</i></figcaption>

The Accessibility menu is available directly from the main menu and in-game menu. In this game, the Preferences button is always present in the bottom-right corner so it’s not visible in the side bar, but otherwise I would have placed Accessibility just below Preferences. Alternatively, Accessibility may be a sub-menu of Preferences/Options, as in [TOMATO CLINIC](https://npckc.itch.io/tomato-clinic) by npckc.

![Player Character uses Switch to move Wall](/assets/pictures/blog/how-to/2021-02-20-custom-preferences-and-accessibility-features-in-renpy/screenshot0034-1024x576.png)

<figcaption>Options panel in TOMATO CLINIC</figcaption>

![Player Character uses Switch to move Wall](/assets/pictures/blog/how-to/2021-02-20-custom-preferences-and-accessibility-features-in-renpy/screenshot0032-1024x576.png)

<figcaption>Accessibility sub-panel under Options in TOMATO CLINIC</figcaption>

Most of the accessibility features are based on the Renpy built-in Accessibility Panel (toggled by pressing A) and the [Ren’Py Accessibility Add-On](https://minute.itch.io/renpy-accessibility).

To reuse options from the built-in Accessibility Panel, I had a look at [00accessibility.rpy](https://github.com/renpy/renpy/blob/master/renpy/common/00accessibility.rpy) and copied them, adapting the format to my own menu.

## Font Override (font family)

Font Override replaces *all* font families with the target font. It comes from the built-in Accessibility Panel and is based on [FontGroups](https://www.renpy.org/doc/html/text.html?highlight=fontgroup#FontGroup). FontGroup has a nice fallback system: if some characters are missing from your override font (e.g. Japanese characters), it will fallback to the default font just for those characters.

Because Font Override is applied to all the fonts used in the game, when using it, you cannot differentiate font styles (text, name, button, etc.) when using it. This shows in Sidetracked!, where the menu font is The Bold Font (uppercase bold font), while the font for normal text is DejaVu Sans.

In Sidetracked!, you can apply the font override directly the from Accessibility menu, and it will apply to all kinds of text.

![Player Character uses Switch to move Wall](/assets/pictures/blog/how-to/2021-02-20-custom-preferences-and-accessibility-features-in-renpy/2020-05-19-v3_006.png)

![Player Character uses Switch to move Wall](/assets/pictures/blog/how-to/2021-02-20-custom-preferences-and-accessibility-features-in-renpy/2020-05-19-v3_003.png)

<figcaption>Before font override</figcaption>

![Player Character uses Switch to move Wall](/assets/pictures/blog/how-to/2021-02-20-custom-preferences-and-accessibility-features-in-renpy/2020-05-19-v3_008.png)

<figcaption>After font override</figcaption>

If you want to allow the user to still distinguish font families between different styles (e.g. menu, character name, dialogue text), I have found 3 (!) methods to let you customize each font individually on a per-usage basis (I only tested the first one).

### Text font attribute

Similar to Ren’Py Accessibility Add-On’s approach. Define your own variable for a certain type of text, e.g. `preferences.pref_font_dialogue`. In screens.rpy, add the font attribute in front of every text instance that should use this font, e.g. in `screen say`, use `text what ... font preferences.pref_font_dialogue`. Repeat for every instance of text that should use this font family (e.g. `text who` for the character name).

Repeat the process for every type of text that needs a different font family: define `preferences.pref_font_menu`, `preferences.pref_font_character_name`, etc.

Limitation: it doesn’t scale well with many text instances. It’s fine for character name (`text who`) and dialogue (`text what`), but as soon as you deal with menus, there will be many more text statements to change.

### Style preference setting

From [this thread](https://lemmasoft.renai.us/forums/viewtopic.php?t=38235) (not tested myself)

```python
# Style definition
renpy.register_style_preference("text", "Open Dyslexic", style.say_dialogue, "font", "gui/OpenDyslexic-Regular.otf")
# Setting
textbutton "Open Dyslexic" action StylePreference("text", "Open Dyslexic")
```

However this uses default styles, so you may end up defining your own styles and putting them in various `text`options as in the first method, if you don’t just differentiate interface, character name and dialogue text.

### GUI preference access

From [this thread](https://lemmasoft.renai.us/forums/viewtopic.php?f=51&t=57895) (not tested myself)

```python
# Definition
define gui.text_font = gui.preference("font_1", "DejaVuSans.ttf")
define gui.name_text_font = gui.preference("font_2", "DejaVuSans.ttf")
define gui.interface_text_font = gui.preference("font_3", "DejaVuSans.ttf")
# Setting
textbutton _("Custom") action [ gui.SetPreference("font_1", "Custom1.otf"), gui.SetPreference("font_2", "Custom2.otf"), gui.SetPreference("font_3", "Custom3.otf")]
```

It also uses default styles, so same remark as above.

## Font color

It is very similar to Font family, although not an override option. Again, there are different ways to set it. I was only interested in changing the font color in dialogue boxes, so I set the `color` property on `text what` directly. This technique comes directly from the Ren’Py Accessibility Add-On.

```python
# accessibility_setup.rpy
init python:
    preferences.pref_text_color = gui.text_color
# screens.rpy
screen accessibility():
    # ...
    vbox:
        style_prefix "check"
        label _("Font Color")
        null height 5
        textbutton _("Default (Purple)"):
            action changeColor(gui.text_color)
            style_suffix "radio_button"
        # I wanted to make that text black, but when selected, it adds a purple
        # outline and it's ugly. Better use a style to mimic default radio text becoming
        # white instead when selected, but didn't manage to inject specific style here
        textbutton _("Black"):
            action changeColor("#000000")
            style_suffix "radio_button"
screen say(who, what):
   # ...
        text what id "what" color preferences.pref_text_color
```

Source: [screens.rpy](https://github.com/hsandt/nanoreno2020-sidetracked/blob/v3.5.3/game/screens.rpy#L1076)

## Self-voicing

This comes directly from the built-in Accessibility panel. I dropped the Clipboard and Debug options so there are only Off and Text-to-speech. This can also be toggled at any time with the V key.

```python
# screens.rpy
screen accessibility():
    # ...
    vbox:
        style_prefix "check"
        # Copied from renpy SDK: 00accessibility.rpy
        label _("Self-Voicing")
        null height 5
        textbutton _("Off"):
            action Preference("self voicing", "disable")
            style_suffix "radio_button"
        textbutton _("Text-to-speech"):
            action Preference("self voicing", "enable")
            style_suffix "radio_button"
```

Unfortunately, the game is not fully playable with self-voicing only, due to other issues. In particular, some options are not voiced correctly (Window Alpha is voiced “Baa-baa”), and the Preferences/Task-Tree button at the bottom-right is not intuitive to reach with the keyboard. This means that it’s very hard to find the Safe Mode option, and furthermore, the captcha at the beginning is simply impossible to solve for blind players as pictures are not commented. There are certainly ways to make it work in my game (e.g. audio captcha). But if your game has a more straightforward UI, it may just work out of the box for you.

## Audio cues

This technique comes directly from the Ren’Py Accessibility Add-On, I just adapted it to my needs. It allows to add notifications when an SFX is played.

First, we define resources with paths to our assets.

```python
# resources.rpy
# Audio
# -1 so it's done just before music_dictionary definition in accessibility_setup.rpy
init -1:
    ## BGM assets
    define audio.title_theme = "<to 19.2>audio/bgm/title_theme.ogg"
    ## BGM mapping (so accessibility feature can get BGM notification text from core name
    ## instead of filepath, which contains the <loop> pattern and is not very convenient)
    define music_to_assets = dict(
        title_theme = audio.title_theme, ...)
    ## SFX assets
    define audio.coins_drop = "audio/sfx/coins_drop.ogg"
    ## SFX mapping (to allow to reuse audio assets for actions with different meanings,
    ## and also so accessibility feature can use short name as dict key rather than filepath)
    define sfx_to_assets = dict(
        coins_drop = audio.coins_drop, ...)
```

Source: [resources.rpy](https://github.com/hsandt/nanoreno2020-sidetracked/blob/v3.5.3/game/resources.rpy#L46)

Second, we define a preference to enable audio cues, as well as the textual descriptions of sounds.

```python
# accessibility_setup.rpy
# Audio cues
default preferences.audio_cues = True
    # alias : "Song Title",
    music_dictionary = dict(
        title_theme = "Title Theme - Upbeat Music", ...)
    # alias : "Sound description."
    sfx_dictionary = dict(
        coins_drop = "Coins dropped", ...)
```

Source: [accessibility_setup.rpy](https://github.com/hsandt/nanoreno2020-sidetracked/blob/v3.5.3/game/accessibility_setup.rpy#L16)

Third, we define functions to play sounds together with the description, if audio cues are enabled.

```python
# accessibility_functions.rpy
    def play_sfx(sound_name, **kwargs):
        # slightly modified to allow passing a string, so you can reuse the same SFX
        # with different meanings, hence different notification texts (currently not used,
        # since only queued sounds with custom notification reuse sounds; but more flexible anyway)
        # also removed "{i}{/i}" which for some reason shows at "[i][/i]"
        renpy.sound.play(sfx_to_assets[sound_name], **kwargs)
        notify_sfx(sound_name)
    def notify_sfx(sound_name):
        if preferences.audio_cues:
            renpy.notify("SFX: " + sfx_dictionary[sound_name])
    def play_music(music_name, **kwargs):
        # same modification as in SFX
        renpy.music.play(music_to_assets[music_name], **kwargs)
        if preferences.audio_cues:
            renpy.notify("Now Playing: " + music_dictionary[music_name])
```

Source: [accessibility_functions.rpy](https://github.com/hsandt/nanoreno2020-sidetracked/blob/v3.5.3/game/accessibility_functions.rpy#L16)

I modified the code slightly above:

- for some reason, “{i}{/i}” shows at “[i][/i]” in the notification message in recent versions of Ren’Py, so I removed them
- I prefer using an audio asset representative name than a full path as dict key. One reason is that filepaths, esp. with music info, can be very long and harder to debug, the other is that it allows me to reuse the same sound with different audio cues, by mapping different sound aliases to different descriptions but to the same audio asset.

Finally, we add a checkbox in the Accessibility panel to toggle Audio Cues.

```python
# screens.rpy
screen accessibility():
    # ...
    vbox:
        style_prefix "check"
        # Copied from Ren'Py Accessibility Add-On: screens replacements.rpy
        label _("Audio")
        null height 5
        # Toggle Audio Cues
        textbutton _("Audio Cues") action ToggleField(preferences, "audio_cues")
```

Source: [screens.rpy](https://github.com/hsandt/nanoreno2020-sidetracked/blob/v3.5.3/game/screens.rpy#L1110)

## Quick menu keys

I created this option just for this game, which shows the key shortcuts that can be used to open the Preferences and Task Tree menus (P and T resp.).

![Player Character uses Switch to move Wall](/assets/pictures/blog/how-to/2021-02-20-custom-preferences-and-accessibility-features-in-renpy/2020-05-19-v3_004.png)

<figcaption>When Quick Menu Keys are ON, Todo list and Preferences buttons show letters T and P</figcaption>

I noticed that Self-Voicing ALWAYS pronounced “T” and “P” at the end of *every* dialogue line. This was very annoying so I added an option to hide those hints. I wish Ren’Py allowed to customize how buttons and labels are read (e.g. “Task Tree” instead of T), including disabling self-voicing completely.

```python
# screens.rpy
screen accessibility():
    # ...
    vbox:
        style_prefix "check"
        xsize 950
        # Copied from Ren'Py Accessibility Add-On: screens replacements.rpy
        label _("HUD")
        null height 5
        # Toggle Quick Menu Key Hints
        textbutton _("Quick Menu Keys (unselect when using self-voicing)") action ToggleField(preferences, "show_quick_menu_keyboard_hints")
```

Source: [screens.rpy](https://github.com/hsandt/nanoreno2020-sidetracked/blob/v3.5.3/game/screens.rpy#L1121)

## Window Alpha

This technique comes directly from the Ren’Py Accessibility Add-On.
It allows the user to change the text box transparency.

```python
# screens.rpy
screen accessibility():
    # ...
    vbox:
        style_prefix "slider"
        # Set Textbox Opacity
        label _("Window Alpha")
        null height 5
        hbox:
            bar value FieldValue(preferences, 'say_window_alpha', 1.0, max_is_zero=False, offset=0, step=.2)
            textbutton _("Reset"):
                action SetField(preferences, "say_window_alpha", 1.0)
# ...
screen say(who, what):
    style_prefix "say"
    window:
        id "window"
        background Transform(style.window.background, alpha=preferences.say_window_alpha)
```

Source: [screens.rpy](https://github.com/hsandt/nanoreno2020-sidetracked/blob/v3.5.3/game/screens.rpy#L1133)

## Windows fullscreen mode and resolution

I added the resolution setting much later than the rest (v3.5.3). It’s working fine on 1080p and allows the user to toggle fullscreen while preserving the last resolution, or force resolution to 720p. However, on 4K screens it will capture at 3200×1800. I considered fixing that bug and making a separate post for this feature, but as I won’t have time to, I prefer dropping the code for the setting right now:

```python
# screens.rpy
screen preferences():
    # ...
    vbox:
        style_prefix "radio"
        label _("Display")
        null height 5
        textbutton _("Fullscreen") action Preference("display", "toggle")
    vbox:
        style_prefix "radio"
        label _("Resolution")
        null height 5
        # pass ratio of native resolution, which is 1080p
        python:
            # for monitors of 1080p and less (actually checking width of 1920),
            # the default size is clamped to max_window_size, so we label "Default" slightly differently
            if renpy.get_renderer_info().get("max_window_size", (9999, 9999))[0] > 1920:
                # e.g. on hi-dpi
                default_res_text = _("Default (1080p)")
            else:
                # e.g. on 1080p
                default_res_text = _("Default")
        textbutton default_res_text action Preference("display", 1.0) # or "window", it also uses __DisplayAction(1.0)
        textbutton _("720p") action Preference("display", 2. / 3.)    # 0.666... because 2/3*1080 = 720
```

Source: [screens.rpy](https://github.com/hsandt/nanoreno2020-sidetracked/blob/v3.5.3/game/screens.rpy#L814)