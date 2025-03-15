---
layout: portfolio_item
title: "Code Tuning for Unity"
subtitle: "Variable tuning and dynamic code branching tool for Unity"
categories: tool unity
asset-dir: "Code-Tuning"
thumbnail: "code-tuning-thumbnail.png"
video-fallback-image: "code-tuning-video-fallback-image.png"
screenshots:
  - path: "Unity-Editor-Code-Tuning-Active.png"
    description: "Code Tuning editor window: active"
  - path: "Unity-Editor-Code-Tuning-Inactive.png"
    description: "Code Tuning editor window: inactive"
meta:
  type: "Debug tool"
  engine: "Unity"
  working-period: "July 2016 - Apr 2017"
deliverable_links:
  - platform: github
    url: "https://github.com/hsandt/hyper-unity-commons/tree/develop/Runtime/Debug"
    title: Source code on GitHub
---

# Code Tuning

*Code Tuning* is a live debugging method that allows the developer to dynamically modify hardcoded behaviors and values, without having to recompile the project (nor use a hot-compile tool). This may be done by inserting temporary code snippets that turn hardcoded values into tunable parameters. The developer can tune the parameters using some interface (IDE debugger, editor window or runtime GUI). Once the developer has found a good value, they can remove the snippet and just keep the final hardcoded value.

I found that this method is used in many studios, under different names (*Code Tweaking*, *Variable Tweaker Panel*, etc.) and implementations (C++ static variable, C++ macro that generates a variable slider in a GUI panel, etc.).

## Rationale

In development in general, we avoid magic numbers and in game development specifically, we try to parameterize gameplay values as much as possible to allow game designers to tune them. Nevertheless, Code Tuning is useful in several cases:
- You are prototyping a very rough feature, maybe something cosmetic that doesn't deserve its own parameter yet (ex: a sinusoidal animation with an `amplitude` and `period`), and you just want to test if this *can work* with certain values.
- You are working on some editor or debug UI, where you need to find good widget size, spacing and color for readability. You're probably not going to change these values later, and just need experiment to find something that works.
- You are debugging and need to disable or modify some chunks of code at runtime to isolate the conditions to reproduce the bug. You know that all these changes are temporary, so you cannot afford to create a proper parameter for each change.

Even if you end up defining the value as a constant to avoid magic numbers, you still need a way to find a good value for this constant.

## Features

I'll show a simple implementation of Code Tuning for Unity that features:
- a fixed number of parameters to tune for different types (branch index, boolean, integer, float)
- an Editor window to tune values visually

## Architecture

- `CodeTuning` is a singleton class that provides a fixed number of parameters of various types.
- `CodeTuningEditorWindow` is an `EditorWindow` that has one editable field per parameter, plus a few meta parameters to define code tuning behavior.
- `CodeTuningGUI` is a runtime `MonoBehaviour` that displays a tuning panel on game screen, including in builds.

Below are excerpts of [CodeTuning.cs](https://github.com/hsandt/hyper-unity-commons/blob/develop/Runtime/Debug/CodeTuning.cs) and [CodeTuningEditorWindow.cs](https://github.com/hsandt/hyper-unity-commons/blob/develop/Runtime/Debug/Editor/CodeTuningEditorWindow.cs) (skipping the many parameters). You can find the full code by clicking on the previous filename hyperlinks.

[CodeTuningGUI.cs](https://github.com/hsandt/hyper-unity-commons/blob/develop/Runtime/Debug/CodeTuningGUI.cs) is quite experimental and ugly, but it was useful for me to tune variables on Android build, when I didn't always have a remote editor connection. In the future, I'd like to remake it with UITK.

```cs
// CodeTuning.cs
using System;
using UnityEngine;

namespace HyperUnityCommons
{
    /// Code tuning runtime class
    public class CodeTuning
    {
        /// Is code tuning active? If not, use default values.
        public bool active;

        public int branchIndex;
        public static int GetBranchIndex(int defaultValue) {
            return TryGetValue<int> (Instance.branchIndex, defaultValue);
        }

        public bool bool1;
        public static bool GetBool1(bool defaultValue) {
            return TryGetValue<bool> (Instance.bool1, defaultValue);
        }

        // bool2, int1, int2, int3, float1, float2, float3...

        // singleton instance
        static CodeTuning _instance;
        public static CodeTuning Instance {
            get {
                if (_instance != null) return _instance;
                Debug.Log ("[DEBUG] Creating CodeTuning instance singleton");
                _instance = new CodeTuning();
                return _instance;
            }
        }

        private CodeTuning() {}

        static T TryGetValue<T>(T tuningValue, T defaultValue) {
            return Instance.active ? tuningValue : defaultValue;
        }
    }
}
```

```cs
// CodeTuningEditorWindow.cs
using System;
using UnityEditor;
using UnityEngine;

namespace HyperUnityCommons.Editor
{
    /// Code tuning editor window
    public class CodeTuningEditorWindow : EditorWindow
    {
        /// Singleton instance
        static CodeTuningEditorWindow window;

        /// Should the scene be repainted when the user changes a value?
        bool repaintScene = false;

        [MenuItem("Debug/Code Tuning")]
        static void Init()
        {
            if (window == null)
                window = (CodeTuningEditorWindow) GetWindow<CodeTuningEditorWindow>(false, "Code Tuning");

            window.Show();
        }

        void OnEnable() {
            // IMPORTANT to reload values on Play, since we are not using a ScriptableObject asset
            // nor a MonoBehaviour to hold CodeTuning data, so they get reset on Play
            Load();
        }

        void OnGUI()
        {
            // use CodeTuning.Instance instance of keeping reference of CodeTuning to be sure
            // it has been defined (reference would be reset on Play)
            EditorGUI.BeginChangeCheck();

            CodeTuning.Instance.active = EditorGUILayout.ToggleLeft("Activate", CodeTuning.Instance.active);

            EditorGUILayout.Space();

            CodeTuning.Instance.branchIndex = EditorGUILayout.IntSlider("Branch Index", CodeTuning.Instance.branchIndex,
                0, 10);
            CodeTuning.Instance.bool1 = EditorGUILayout.Toggle("Bool 1", CodeTuning.Instance.bool1);
            // bool2, int1, int2, int3, float1, float2, float3...
            repaintScene = EditorGUILayout.Toggle(new GUIContent ("Repaint Scene on Change",
                "Check if the values are used in OnDrawGizmos / OneSceneGUI"), repaintScene);

            if (EditorGUI.EndChangeCheck()) {
                Save();
                if (repaintScene)
                    SceneView.RepaintAll();
            }
        }

        void Load() {
            if (EditorPrefs.HasKey("CodeTuning.active")) {
                CodeTuning.Instance.active = EditorPrefs.GetBool ("CodeTuning.active");
            }

            if (EditorPrefs.HasKey("CodeTuning.branchIndex"))
                CodeTuning.Instance.branchIndex = EditorPrefs.GetInt("CodeTuning.branchIndex");

            if (EditorPrefs.HasKey("CodeTuning.bool1"))
                CodeTuning.Instance.active = EditorPrefs.GetBool("CodeTuning.bool1");

            // bool2, int1, int2, int3, float1, float2, float3...

            if (EditorPrefs.HasKey("CodeTuning.repaintScene"))
                repaintScene = EditorPrefs.GetBool("CodeTuning.repaintScene");
        }

        void Save() {
            EditorPrefs.SetBool("CodeTuning.active", CodeTuning.Instance.active);
            EditorPrefs.SetInt("CodeTuning.branchIndex", CodeTuning.Instance.branchIndex);
            EditorPrefs.SetBool("CodeTuning.bool1", CodeTuning.Instance.bool1);
            // bool2, int1, int2, int3, float1, float2, float3...
            EditorPrefs.SetBool("CodeTuning.repaintScene", repaintScene);
        }
    }
}
```

## Screenshots

{% include portfolio-item-screenshots.html screenshots=page.screenshots %}

*Note that fewer fields are defined on these screenshots*

## Editor window parameters

| Parameter               | Description                                                                                                                                   |
| ----------------------- | --------------------------------------------------------------------------------------------------------------------------------------------- |
| Activate                | If true, enable code tuning. Else, default values are used.                                                                                   |
| Branch Index            | An integer dedicated to tunable branching (it has nothing special).                                                                           |
| Bool X                  | A tunable bool value.                                                                                                                         |
| Int X                   | A tunable bool value.                                                                                                                         |
| Float X                 | A tunable float value.                                                                                                                        |
| Repaint Scene on Change | If true, repaint the editor Scene View on value changed. Check this for editor drawing method (Editor.OnSceneGUI, MonoBehaviour.OnDrawGizmos) |

## Usage

- Import [CodeTuning.cs](https://github.com/hsandt/hyper-unity-commons/blob/develop/Runtime/Debug/CodeTuning.cs) and [CodeTuningEditorWindow.cs](https://github.com/hsandt/hyper-unity-commons/blob/develop/Runtime/Debug/Editor/CodeTuningEditorWindow.cs) in your Unity project (make sure to put CodeTuningEditorWindow.cs under an `Editor` folder)
- Open the Code Tuning editor window with top menu bar > Debug > Code Tuning
- Check *Activate*
- Replace hardcoded values with in code with `CodeTuning.Instance.GetBranchIndex|GetBoolX|GetIntX|GetFloatX(defaultValue)`. I recommend to always use meaningful default values to 1. get a good starting value and 2. avoid terrible results if the code is used at runtime, and you forgot to remove some CodeTuning `Get` calls before building the game
- If tuning runtime values: play the scene you wanted to tune. If tuning editor values: open the editor window or select the Game Object with a gizmo that needs tuning.
- Tune the values in the Code Tuning editor window to see live changes
- When you have found a better value but want to continue tuning, replace `defaultValue` with the new value, and repeat the process
- When you have found satisfying values, replace `CodeTuning.Instance.Get...(defaultValue)` with the new value (it's cleaner to remove them all before building the game)
- If you don't like magic numbers, you can now turn them into constants

Note: values are stored in the Editor preferences and may be lost on Play/Stop and recompile, so it's better to regularly write down the better values.

## Example

```csharp
// Case 1: you want to test a new method only when you check some toggle
// => use an optional branch

NewExperimentalMethod();

// becomes...

if (CodeTuning.Instance.GetBool1(false)) {
    // only executed when CodeTuning is active and Bool 1 toggle is checked
    NewExperimentalMethod();
}

// Case 2: you want to test 3 different lines or blocks of code without commenting them
// in and out and recompiling every time
// => use tunable branching

Color c = Color.red;
// Color c = Color.blue;
// Color c = Color.yellow;

// becomes...

Color c;
switch (CodeTuning.Instance.GetBranchIndex(0)) {
case 0:
    c = Color.red;
    break;
case 1:
    c = Color.blue
    break;
default:
    c = Color.yellow;
    break;
}

// Case 3: you want to tune a hardcoded value, but you don't want to promote it to
// a MonoBehaviour serialized attribute right now
// => use a tunable float

float motionDelta = 2.5f * Time.deltaTime;

// becomes...

float motionDelta = CodeTuning.Instance.GetFloat1(speed) * Time.deltaTime;
```

## Demonstration

I have yet to capture a video of CodeTuning for Unity, so here is a video of the very similar Code Tuner I wrote for PICO-8:

<video controls class="center">
  <source src="/assets/pictures/portfolio/Code-Tuning/sonic-pico8_v2.2_debug code tuner 2018-12-20.mp4" type="video/mp4">
</video>

## Limitations & Going further

- CodeTuning won’t affect variables that are **only initialized on game start or scene load**. More exactly, it will only affect such variables if you activated CodeTuning before the variable was set, and even then, they won’t change later even if the CodeTuning parameters are changed, because they are not regularly reassigned. CodeTuning works the best when the `Get` methods are used in loops.
- Currently, the code is **not flexible enough to allow an indefinite number of parameters and types**. There is a limited number of parameters of each type, so you must manually add extra parameters to the class by duplicating existing attributes. You must also add additional definitions for new types like `Color`. In C++, it's a bit faster to do thanks to macro definitions (I'm doing this in Unreal Engine).
  - This could be improved by using a dictionary, allowing us to map arbitrary variable names to values of various types. In C#, this would require using `object` + cast or a custom variant type.
  - In Lua, it's easier because the language is not statically typed. I wrote [codetuner.lua](https://github.com/hsandt/pico-boots/blob/develop/src/engine/debug/codetuner.lua) for my PICO-8 framework [pico-boots](https://github.com/hsandt/pico-boots/tree/develop), where you can create an arbitrary tunable variable with `tuned("my var", default_value)`.
