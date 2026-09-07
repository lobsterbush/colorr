# Leagues covered by colorr

Returns the league codes colorr knows about. Every code is a valid
`league` argument to
[`colorr.teams`](https://lobsterbush.github.io/colorr/reference/colorr.teams.md),
[`colorr.colors`](https://lobsterbush.github.io/colorr/reference/colorr.colors.md)
and
[`colorr.pal`](https://lobsterbush.github.io/colorr/reference/colorr.pal.md).
The pseudo-league `"soccer"` is also accepted by those functions and
pools every soccer league into a single namespace.

## Usage

``` r
colorr.leagues(soccer_only = FALSE)
```

## Arguments

- soccer_only:

  Logical. If `TRUE`, return only the soccer leagues.

## Value

Character vector of league codes.

## Author

Charles Crabtree <charles.crabtree@monash.edu>

## Examples

``` r
colorr.leagues()
colorr.leagues(soccer_only = TRUE)
```
