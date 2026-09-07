# MLB colors

Returns a named character vector of hex colors for an MLB team. Teams
cover the 2026 Major League Baseball season. Call `colorr.teams("mlb")`
for the full list of team names.

## Usage

``` r
mlb.colors(
  set = c("angels", "astros", "athletics", "blue_jays", "braves", "brewers", "cardinals",
    "cubs", "diamondbacks", "dodgers", "giants", "guardians", "indians", "mariners",
    "marlins", "mets", "nationals", "orioles", "padres", "phillies", "pirates",
    "rangers", "rays", "red_sox", "reds", "rockies", "royals", "tigers", "twins",
    "white_sox", "yankees"),
  legacy = FALSE
)
```

## Arguments

- set:

  Character string naming an MLB team. The retired team name `"indians"`
  still resolves, to the renamed franchise.

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
[`scale_fill_mlb`](https://lobsterbush.github.io/colorr/reference/mlb-scales.md)
for the ggplot2 scales.

## Author

Charles Crabtree <charles.crabtree@monash.edu>

## Examples

``` r
# Colorado Rockies colors
pal <- mlb.colors("rockies")
pal
pie(rep(1, length(pal)), labels = sprintf("%d (%s)", seq_along(pal), pal), col = pal)

# Seattle Mariners colors
mlb.colors("mariners")

# the palette that shipped with colorr 1.0.1
mlb.colors("rockies", legacy = TRUE)
```
