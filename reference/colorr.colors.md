# Team colors from any league

League-agnostic version of
[`epl.colors`](https://lobsterbush.github.io/colorr/reference/epl.colors.md)
and friends: name the league and the team and get the palette back.
Handy when the league is itself a variable.

## Usage

``` r
colorr.colors(league, set, legacy = FALSE)
```

## Arguments

- league:

  Character string naming a league, as returned by
  [`colorr.leagues`](https://lobsterbush.github.io/colorr/reference/colorr.leagues.md),
  or `"soccer"` for every soccer club at once.

- set:

  Character string naming a team in that league. Team names retired
  since colorr 1.0.1, namely `"indians"` and `"redskins"`, still resolve
  to the renamed franchise.

- legacy:

  Logical. If `TRUE`, return the palette that shipped with colorr 1.0.1.

## Value

Named character vector of hex color strings.

## Author

Charles Crabtree <charles.crabtree@monash.edu>

## Examples

``` r
colorr.colors("nhl", "kraken")
colorr.colors("soccer", "real_madrid")

# the same palette either way
identical(colorr.colors("nba", "bucks"), nba.colors("bucks"))
```
