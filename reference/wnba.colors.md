# WNBA colors

Returns a named character vector of hex colors for a WNBA team. Teams
cover the 2026 WNBA season, including the Portland Fire and Toronto
Tempo expansion teams. Call `colorr.teams("wnba")` for the full list of
team names.

## Usage

``` r
wnba.colors(
  set = c("aces", "dream", "fever", "fire", "liberty", "lynx", "mercury", "mystics",
    "sky", "sparks", "storm", "sun", "tempo", "valkyries", "wings"),
  legacy = FALSE
)
```

## Arguments

- set:

  Character string naming a WNBA team.

- legacy:

  Logical. Ignored for the WNBA; colorr 1.0.1 shipped no WNBA palettes.
  Kept so every colorr palette function takes the same arguments.

## Value

Named character vector of hex color strings.

## See also

[`colorr.teams`](https://lobsterbush.github.io/colorr/reference/colorr.teams.md)
to list teams,
[`scale_fill_wnba`](https://lobsterbush.github.io/colorr/reference/wnba-scales.md)
for the ggplot2 scales.

## Author

Charles Crabtree <charles.crabtree@monash.edu>

## Examples

``` r
# New York Liberty colors
pal <- wnba.colors("liberty")
pal
pie(rep(1, length(pal)), labels = sprintf("%d (%s)", seq_along(pal), pal), col = pal)

# Golden State Valkyries colors
wnba.colors("valkyries")
```
