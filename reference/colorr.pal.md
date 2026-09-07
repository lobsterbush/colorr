# Team color palette generator

Turns a team palette into a palette function of the kind ggplot2 and
`grDevices` expect: call it with `n` and it returns `n` colors. When `n`
exceeds the number of colors the team actually has, the palette is
interpolated with
[`colorRampPalette`](https://rdrr.io/r/grDevices/colorRamp.html).

## Usage

``` r
colorr.pal(league, set, reverse = FALSE, legacy = FALSE)
```

## Arguments

- league:

  Character string naming a league, as returned by
  [`colorr.leagues`](https://lobsterbush.github.io/colorr/reference/colorr.leagues.md),
  or `"soccer"` for every soccer club at once.

- set:

  Character string naming a team in that league.

- reverse:

  Logical. If `TRUE`, reverse the color order.

- legacy:

  Logical. If `TRUE`, build from the colorr 1.0.1 palette.

## Value

A function of one argument `n` returning a character vector of `n` hex
colors.

## See also

[`scale_fill_nba`](https://lobsterbush.github.io/colorr/reference/nba-scales.md)
and friends, which wrap this for ggplot2.

## Author

Charles Crabtree <charles.crabtree@monash.edu>

## Examples

``` r
pal <- colorr.pal("nba", "bucks")
pal(3)
pal(8)  # interpolated past the team's own colors
```
