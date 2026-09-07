# colorr: color palettes for sports teams

I built colorr to use team colours in R figures without looking up each
hex code. Choose a named colour vector or add a colour or fill scale to
a ggplot.

## Details

Palette functions, one per league:
[`epl.colors`](https://lobsterbush.github.io/colorr/reference/epl.colors.md),
[`soccer.colors`](https://lobsterbush.github.io/colorr/reference/soccer.colors.md),
[`mlb.colors`](https://lobsterbush.github.io/colorr/reference/mlb.colors.md),
[`nba.colors`](https://lobsterbush.github.io/colorr/reference/nba.colors.md),
[`wnba.colors`](https://lobsterbush.github.io/colorr/reference/wnba.colors.md),
[`nfl.colors`](https://lobsterbush.github.io/colorr/reference/nfl.colors.md)
and
[`nhl.colors`](https://lobsterbush.github.io/colorr/reference/nhl.colors.md).
[`colorr.colors`](https://lobsterbush.github.io/colorr/reference/colorr.colors.md)
does the same job when the league is itself a variable.

To see which teams are included, use
[`colorr.leagues`](https://lobsterbush.github.io/colorr/reference/colorr.leagues.md)
and
[`colorr.teams`](https://lobsterbush.github.io/colorr/reference/colorr.teams.md).

For ggplot2, every league has `scale_colour_*`, `scale_color_*` and
`scale_fill_*` constructors, e.g.
[`scale_fill_nba`](https://lobsterbush.github.io/colorr/reference/nba-scales.md).
They are built on
[`colorr.pal`](https://lobsterbush.github.io/colorr/reference/colorr.pal.md),
which converts any team palette into a palette function.

Every palette function takes `legacy = TRUE`, which returns the palette
that shipped with colorr 1.0.1 rather than the current-season one.

## See also

Useful links:

- <https://lobsterbush.github.io/colorr/>

- <https://github.com/lobsterbush/colorr>

- Report bugs at <https://github.com/lobsterbush/colorr/issues>

## Author

**Maintainer**: Charles Crabtree <charles.crabtree@monash.edu>
