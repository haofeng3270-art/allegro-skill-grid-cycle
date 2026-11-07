# Allegro Grid Cycle

[中文说明](README.md)

A Cadence Allegro PCB Editor SKILL script that cycles grid spacing through **1 → 5 → 10 → 20 → 1 mil** when you press **G**. The first press sets the grid to 1 mil.

## Installation and usage

1. Download `grid_cycle.il` and place it in a permanent location, for example `C:/allegro-skill/grid_cycle.il`.
2. Open Allegro PCB Editor and a design, then enter the following in the Allegro command line, replacing the path with the actual location:

   ```text
   skill load("C:/allegro-skill/grid_cycle.il")
   ```

3. Focus the canvas and press G to cycle the grid. The command line displays the result.

To load the script automatically at startup, append the following line to your user `pcbenv/allegro.ilinit`, preserving any existing contents:

```lisp
load("C:/allegro-skill/grid_cycle.il")
```

Restart Allegro. Loading the script overrides the existing G shortcut for the current session. To disable automatic loading, remove the line and restart. Check `pcbenv/env` for any previous G binding.

## Behavior and limitations

- Sets the X and Y spacing for the Non-Etch grid and every Etch layer while preserving their origins. Existing differences in spacing between layers are replaced. Grid changes cannot be undone.
- Converts mils to the drawing units. If a change fails, check the command-line message, drawing units, and Drawing Parameters accuracy.
- An already-open Grids dialog does not refresh automatically. Close and reopen it to see the changes.
- The APIs were checked against local Allegro 17.4 SKILL documentation, but the script has not yet been tested in Allegro. Behavior in other versions and while commands such as routing are active needs verification.

## License

[MIT](LICENSE)
