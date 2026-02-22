# ScalableMinimap (Vanilla WoW 1.12, tested on TurtleWow)

ScalableMinimap is a lightweight addon for World of Warcraft 1.12 that allows you to scale and reposition the minimap while keeping the zone text and clock fixed in the top-right corner of the screen.

This addon is ideal for players who want a larger minimap without breaking the layout of the default UI.

- compatibility tested with ShaguTweaks

---

## Features

- Scalable minimap  
  Resize the minimap using /minimapscale X. (e.g. /minimapscale 1.2)

- Movable minimap  
  Reposition the minimap anywhere using /minimappos X Y. (this is offset of the right corner, use e.g. `/minimappos -10 -20` to have 10 pixels from the right and 20 from the top)

- Fixed zone text  
  The zone name stays anchored in the top-right corner, unaffected by minimap scaling.

- Fixed clock  
  The clock frame (Clock) is detached from the minimap and remains fixed under the zone text.

- Clean and stable  
  No UI errors, no drifting borders, no misaligned textures.

---

## Installation

You can install ScalableMinimap in two ways:

---

### 1. Manual Installation

1. Download or clone this repository.
2. Create a folder named ScalableMinimap inside:
   World of Warcraft\Interface\AddOns\
3. Place the following files inside the folder:
   - ScalableMinimap.lua
   - ScalableMinimap.toc
4. Restart the game or type /reload.

---

### 2. Turtle WoW Launcher Installation

If you're playing on Turtle WoW, you can install the addon directly through the launcher:

1. Open the Turtle WoW Launcher.
2. Go to Addons.
3. Click Add New Addon.
4. Paste the GitHub repository URL:
   [https://github.com/chazzka/ScalableMinimap](https://github.com/chazzka/ScalableMinimap/)
5. Confirm and let the launcher install it automatically.

This is the easiest method for Turtle WoW players.

---

## Commands

### Scale the minimap
/minimapscale <number>

Example:
/minimapscale 1.5

### Move the minimap
/minimappos <x> <y>

Example:
/minimappos -20 -40

---

## Screenshots

<img width="618" height="481" alt="map" src="https://github.com/user-attachments/assets/3d27028b-3075-4acd-a0d7-842f3863db79" />



---

## License

MIT License — free to use, modify, and share.

---

## Credits

Created by Adam, refined with the help of Copilot.
