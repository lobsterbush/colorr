# Changelog

## colorr 1.1.0

CRAN release: 2026-08-22

### Palettes refreshed

- Every palette now reflects the current season: 2026-27 for the Premier
  League, LaLiga, Serie A, the Bundesliga, Ligue 1, the NBA and the NHL;
  2026 for MLS, MLB, the NFL and the WNBA. The 1.0.1 palettes were fixed
  at 2016-17 and 2016.
- NBA palettes pick up the rebrands since 2017, including the Bucks,
  Clippers, Grizzlies, Jazz, Pistons and Timberwolves.
- Renamed and relocated franchises are current: the Cleveland Guardians,
  Washington Commanders, Las Vegas Raiders, Utah Mammoth and the
  Athletics. The old team names `"indians"` and `"redskins"` still
  resolve, to the renamed franchise.
- Teams added since 1.0.1: the Seattle Kraken and Utah Mammoth (NHL),
  and the promoted, relegated and expansion clubs across every soccer
  league.

### New

- [`wnba.colors()`](https://lobsterbush.github.io/colorr/reference/wnba.colors.md)
  covers all 15 WNBA teams for the 2026 season, including the Golden
  State Valkyries and the Portland Fire and Toronto Tempo expansion
  franchises.
- [`soccer.colors()`](https://lobsterbush.github.io/colorr/reference/soccer.colors.md)
  covers 135 clubs: the Premier League, LaLiga, Serie A, the Bundesliga,
  Ligue 1 and Major League Soccer.
- ggplot2 scales for every league: `scale_colour_*()`, `scale_color_*()`
  and `scale_fill_*()`, e.g. `scale_fill_nba("bucks")`. Discrete by
  default; pass `discrete = FALSE` for a continuous gradient through the
  team’s colors.
- [`colorr.pal()`](https://lobsterbush.github.io/colorr/reference/colorr.pal.md)
  turns any team palette into a palette function of `n`, interpolating
  with
  [`grDevices::colorRampPalette()`](https://rdrr.io/r/grDevices/colorRamp.html)
  when `n` exceeds the number of colors a team has.
- [`colorr.colors()`](https://lobsterbush.github.io/colorr/reference/colorr.colors.md)
  looks up a palette when the league is itself a variable, and
  [`colorr.leagues()`](https://lobsterbush.github.io/colorr/reference/colorr.leagues.md)
  and
  [`colorr.teams()`](https://lobsterbush.github.io/colorr/reference/colorr.teams.md)
  list what is available.
- A `testthat` suite covering palette validity, backwards compatibility
  and the scales.

### Backwards compatibility

- Every team name accepted by colorr 1.0.1 still works.
- Every palette function takes `legacy = TRUE`, which returns the
  palette that shipped with 1.0.1 rather than the current one, so older
  figures reproduce.

### Bug fixes

- `mlb.colors("diamondbacks")` returned `NULL`. The palette was defined
  under a misspelled name and the
  [`switch()`](https://rdrr.io/r/base/switch.html) arm never matched.
- The package no longer imports unused functions from `graphics` and
  `stats`.

## colorr 1.0.1

- Updated maintainer email and repository URLs.

## colorr 1.0.0

CRAN release: 2017-02-20

- First CRAN release. Palettes for EPL, MLB, NBA, NHL and NFL teams.
