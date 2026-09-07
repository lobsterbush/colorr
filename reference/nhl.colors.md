# NHL colors

Returns a named character vector of hex colors for an NHL team. Teams
cover the 2026-27 NHL season, plus the Arizona Coyotes. Call
`colorr.teams("nhl")` for the full list of team names.

## Usage

``` r
nhl.colors(
  set = c("avalanche", "blackhawks", "blue_jackets", "blues", "bruins", "canadiens",
    "canucks", "capitals", "coyotes", "devils", "ducks", "flames", "flyers",
    "golden_knights", "hurricanes", "islanders", "jets", "kings", "kraken", "lightning",
    "maple_leafs", "oilers", "panthers", "penguins", "predators", "rangers", "red_wings",
    "sabres", "senators", "sharks", "stars", "utah", "wild"),
  legacy = FALSE
)
```

## Arguments

- set:

  Character string naming an NHL team.

- legacy:

  Logical. If `TRUE`, return the palette that shipped with colorr 1.0.1
  instead of the current one, so older figures stay reproducible. Not
  every team has a legacy palette; teams added since 1.0.1 will throw an
  error.

## Value

Named character vector of hex color strings.

## See also

[`colorr.teams`](https://lobsterbush.github.io/colorr/reference/colorr.teams.md)
to list teams,
[`scale_fill_nhl`](https://lobsterbush.github.io/colorr/reference/nhl-scales.md)
for the ggplot2 scales.

## Author

Charles Crabtree <charles.crabtree@monash.edu>

## Examples

``` r
# Anaheim Ducks colors
pal <- nhl.colors("ducks")
pal
pie(rep(1, length(pal)), labels = sprintf("%d (%s)", seq_along(pal), pal), col = pal)

# Utah Mammoth colors
nhl.colors("utah")

# the palette that shipped with colorr 1.0.1
nhl.colors("ducks", legacy = TRUE)
```
