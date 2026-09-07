# EPL colors

Returns a named character vector of hex colors for an EPL team. Teams
cover the 2026-27 Premier League season, plus every club that appeared
in colorr 1.0.1. Call `colorr.teams("epl")` for the full list of team
names.

## Usage

``` r
epl.colors(
  set = c("arsenal", "aston_villa", "bournemouth", "brentford", "brighton", "burnley",
    "chelsea", "coventry_city", "crystal_palace", "everton", "fulham", "hull",
    "ipswich_town", "leeds_united", "leicester", "liverpool", "man_city", "man_united",
    "middlesbrough", "newcastle", "nottingham_forest", "southampton", "stoke_city",
    "sunderland", "swansea_city", "tottenham", "watford", "west_bromich_albion",
    "west_ham"),
  legacy = FALSE
)
```

## Arguments

- set:

  Character string naming an EPL team.

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
[`scale_fill_epl`](https://lobsterbush.github.io/colorr/reference/epl-scales.md)
for the ggplot2 scales.

## Author

Charles Crabtree <charles.crabtree@monash.edu>

## Examples

``` r
# Manchester United colors
pal <- epl.colors("man_united")
pal
pie(rep(1, length(pal)), labels = sprintf("%d (%s)", seq_along(pal), pal), col = pal)

# Tottenham Hotspur colors
epl.colors("tottenham")

# the palette that shipped with colorr 1.0.1
epl.colors("man_united", legacy = TRUE)
```
