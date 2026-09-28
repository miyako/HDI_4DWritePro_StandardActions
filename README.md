# HDI_4DWritePro_StandardActions

A 4D v16 **HDI** (How Do I) binary database converted to a 4D project using 4D 21, demonstrating how to wire menu items and buttons to **4D Write Pro standard actions**. The codebase was then modernised and cleaned up with the help of **GitHub Copilot**.

## Overview

The demo opens a splash window ("HDI") and, on clicking **Demo**, a second window ("HDI2") containing a tab control with a 4D Write Pro area alongside several other examples (list form, JSON input/output). It shows how to associate a pop-up menu, a toolbar button, and a contextual menu with 4D Write Pro's built-in standard actions (`Associated standard action`), instead of writing custom handlers for common editing commands.

## Features

- **Pop-up menu bound to a standard action** -- a push button ("3D Button") opens a dynamic pop-up menu whose item toggles the 4D Write Pro area's horizontal ruler (`visibleHorizontalRuler`) via `Associated standard action`, with no custom toggle logic.
- **Contextual menu on the 4D Write Pro area** -- right-clicking the Write Pro area (`WParea`) opens a menu wired to the `cut`/`copy`/`paste` standard actions plus `fontStyle` and the ruler toggle.
- **Tabbed navigation** -- a tab control switches between the Write Pro area and other input/output example pages, driven by a `SAMPLES` collection loaded from JSON at startup.
- **Non-blocking splash/demo windows** -- window-reuse detection avoids opening duplicate splash windows; the demo window carries `Form`-scoped state (`Form.quit`, `Form.minimumVersion`) instead of interprocess variables.
- **Localised UI** -- all menu items, form labels, and messages are resolved through XLIFF (`:xliff:` / `Localized string`), with English and Japanese resources provided.
- **Dark mode and Liquid Glass aware** -- form colours use 4D's `automatic`/`automaticAlternate` values and `prefers-color-scheme` CSS, and button heights adapt to macOS Tahoe's Liquid Glass vs. classic rendering via `form-theme` media queries.

## Points of Interest

Notes for developers browsing the source, beyond what the demo itself shows:

- **`Associated standard action`** is the key command tying menu items to built-in 4D Write Pro behaviour -- see `Forms/HDI2/method.4dm`'s `On Load` handler for how the pop-up and contextual menus are built.
- **`Dynamic pop up menu`** returns the **Text** name of the chosen standard action (not an index), which the caller can then branch on or simply ignore, as it is here, since the action already executed via the menu item's association.
- Project methods use modern `#DECLARE`/`var` syntax throughout (no legacy `C_*` directives); `Compiler_Variables.4dm` declares the process variables shared between the pop-up menu and the Write Pro area's contextual menu.
- Menu items that only wrap a single built-in command (e.g. Quit) use the `"action"` property in `menus.json` rather than a project method wrapper.
- Subroutines, form-event handlers, and callback methods are marked `"invisible":true` so only meaningful entry points show up in the Run Method dialog.

## Requirements

- 4D 21 or later (project uses `compatibilityVersion` features from 4D 21 R1+).
- 4D Write Pro license (this example specifically demonstrates 4D Write Pro standard actions).

## Getting Started

1. Open `Project/HDI_4DWritePro_StandardActions.4DProject` in 4D.
2. Run the `00_Start` method, or launch the project -- the splash window opens automatically.
3. Click **Demo** to open the main window and try the ruler toggle button, the Write Pro area's contextual menu, and the other tabs.

## Origin

This project started as a binary `.4DB` example database originally distributed with 4D v16 R3. It was converted to the modern project architecture (`.4DProject`) using 4D 21's built-in binary-to-project conversion tool.

- **Blog post:** https://blog.4d.com/create-your-own-interface-for-4d-write-pro/
- **Original download:** https://download.4d.com/Demos/4D_v16_R3/HDI_4DWritePro_StandardActions.zip

## References

- 4D Write Pro standard actions: https://developer.4d.com/docs/WritePro/wp-standard-actions
- `Associated standard action` menu item property: https://developer.4d.com/docs/commands/set-menu-item-property
- `Dynamic pop up menu`: https://developer.4d.com/docs/commands/dynamic-pop-up-menu
- Menu properties (`action` vs `method`): https://developer.4d.com/docs/Menus/properties
- CSS in 4D forms (dark mode, Liquid Glass): https://developer.4d.com/docs/FormEditor/stylesheets
- Directory of other modernised HDI examples: https://github.com/miyako/4d-hdi

## License

MIT -- see [LICENSE](LICENSE).
