# NBA colors

Returns a named character vector of hex colors for an NBA team. Teams
cover the 2026-27 NBA season, plus the Seattle SuperSonics. Call
`colorr.teams("nba")` for the full list of team names.

## Usage

``` r
nba.colors(
  set = c("blazers", "bucks", "bulls", "cavs", "celtics", "clippers", "grizzlies",
    "hawks", "heat", "hornets", "jazz", "kings", "knicks", "lakers", "magic", "mavs",
    "nets", "nuggets", "pacers", "pelicans", "pistons", "raptors", "rockets", "sixers",
    "sonics", "spurs", "suns", "thunder", "warriors", "wizards", "wolves"),
  legacy = FALSE
)
```

## Arguments

- set:

  Character string naming an NBA team.

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
[`scale_fill_nba`](https://lobsterbush.github.io/colorr/reference/nba-scales.md)
for the ggplot2 scales.

## Author

Charles Crabtree <charles.crabtree@monash.edu>

## Examples

``` r
# Detroit Pistons colors
pal <- nba.colors("pistons")
pal
pie(rep(1, length(pal)), labels = sprintf("%d (%s)", seq_along(pal), pal), col = pal)

# Milwaukee Bucks colors
nba.colors("bucks")

# the palette that shipped with colorr 1.0.1
nba.colors("pistons", legacy = TRUE)
```
