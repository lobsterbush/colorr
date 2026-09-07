# Teams covered by colorr

Returns the team names accepted by a league's palette function. With no
argument it returns a named list covering every league.

## Usage

``` r
colorr.teams(league = NULL)
```

## Arguments

- league:

  Character string naming a league, as returned by
  [`colorr.leagues`](https://lobsterbush.github.io/colorr/reference/colorr.leagues.md),
  or `"soccer"` for every soccer club at once. If `NULL` (the default),
  teams for all leagues are returned as a named list.

## Value

Character vector of team names, or a named list of them when `league` is
`NULL`.

## Author

Charles Crabtree <charles.crabtree@monash.edu>

## Examples

``` r
colorr.teams("wnba")
colorr.teams("ligue1")

# how many teams each league contributes
lengths(colorr.teams())
```
