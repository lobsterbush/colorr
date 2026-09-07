# NFL colors

Returns a named character vector of hex colors for an NFL team. Teams
cover the 2026 NFL season. Call `colorr.teams("nfl")` for the full list
of team names.

## Usage

``` r
nfl.colors(
  set = c("bears", "bengals", "bills", "broncos", "browns", "buccaneers", "cardinals",
    "chargers", "chiefs", "colts", "commanders", "cowboys", "dolphins", "eagles",
    "falcons", "giants", "jaguars", "jets", "lions", "niners", "packers", "panthers",
    "patriots", "raiders", "rams", "ravens", "redskins", "saints", "seahawks",
    "steelers", "texans", "titans", "vikings"),
  legacy = FALSE
)
```

## Arguments

- set:

  Character string naming an NFL team. The retired team name
  `"redskins"` still resolves, to the renamed franchise.

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
[`scale_fill_nfl`](https://lobsterbush.github.io/colorr/reference/nfl-scales.md)
for the ggplot2 scales.

## Author

Charles Crabtree <charles.crabtree@monash.edu>

## Examples

``` r
# Detroit Lions colors
pal <- nfl.colors("lions")
pal
pie(rep(1, length(pal)), labels = sprintf("%d (%s)", seq_along(pal), pal), col = pal)

# Denver Broncos colors
nfl.colors("broncos")

# the palette that shipped with colorr 1.0.1
nfl.colors("lions", legacy = TRUE)
```
