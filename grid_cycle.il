; Cycle all Allegro grids through 1, 5, 10 and 20 mil.
; Loading this file assigns G for the current Allegro session.
lfGridIndex = 0

procedure(lfCycleGrid()
  let((units factor sizes mils spacing grid failed names)
    units = car(axlDBGetDesignUnits())
    factor = cond(
      (units == "mils" 1.0)
      (units == "inches" 0.001)
      (units == "millimeters" 0.0254)
      (units == "microns" 25.4)
      (t nil)
    )
    names = axlDBGridGet(nil)
    if(!factor || !names then
      printf("Grid cycle: open a design with supported units first. Units: %L\n" units)
    else
      sizes = '(1 5 10 20)
      mils = nth(lfGridIndex sizes)
      spacing = mils * factor
      failed = nil
      foreach(name names
        grid = axlDBGridGet(name)
        grid->xGrids = spacing
        grid->yGrids = spacing
        unless(axlDBGridSet(grid)
          failed = t
          printf("Grid cycle: failed to set %s.\n" name)
        )
      )
      if(failed then
        printf("Grid cycle: not all grids changed; check drawing accuracy.\n")
      else
        printf("Grid cycle: %d mil\n" mils)
        lfGridIndex = mod(lfGridIndex + 1 4)
      )
    )
  )
)

axlCmdRegister("lf_grid_cycle" 'lfCycleGrid ?cmdType "general")
axlSetFunckey("g" "lf_grid_cycle")
printf("Grid cycle loaded: press G for 1 / 5 / 10 / 20 mil.\n")

