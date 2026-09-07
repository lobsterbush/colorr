# ggplot2 scales from an NBA team palette

Colour and fill scales that take their colors from an NBA team, the
ggplot2 counterpart of
[`nba.colors`](https://lobsterbush.github.io/colorr/reference/nba.colors.md).
`scale_color_nba` is an alias for `scale_colour_nba`.

## Usage

``` r
scale_colour_nba(set, discrete = TRUE, reverse = FALSE, legacy = FALSE, ...)

scale_color_nba(set, discrete = TRUE, reverse = FALSE, legacy = FALSE, ...)

scale_fill_nba(set, discrete = TRUE, reverse = FALSE, legacy = FALSE, ...)
```

## Arguments

- set:

  Character string naming an NBA team. See `colorr.teams("nba")`.

- discrete:

  Logical. `TRUE` (the default) builds a discrete scale; `FALSE` builds
  a continuous gradient through the team's colors.

- reverse:

  Logical. If `TRUE`, reverse the color order.

- legacy:

  Logical. If `TRUE`, use the palette that shipped with colorr 1.0.1.

- ...:

  Passed on to
  [`discrete_scale`](https://ggplot2.tidyverse.org/reference/discrete_scale.html)
  when `discrete` is `TRUE`, otherwise to
  [`scale_fill_gradientn`](https://ggplot2.tidyverse.org/reference/scale_gradient.html)
  or
  [`scale_colour_gradientn`](https://ggplot2.tidyverse.org/reference/scale_gradient.html).

## Value

A ggplot2 scale, to be added to a plot with `+`.

## See also

[`nba.colors`](https://lobsterbush.github.io/colorr/reference/nba.colors.md)
for the raw palette,
[`colorr.pal`](https://lobsterbush.github.io/colorr/reference/colorr.pal.md)
for the palette function.

## Author

Charles Crabtree <charles.crabtree@monash.edu>

## Examples

``` r
library(ggplot2)

ggplot(mtcars, aes(factor(cyl), mpg, fill = factor(cyl))) +
 geom_boxplot() +
 scale_fill_nba("bucks")   # Milwaukee Bucks

ggplot(mtcars, aes(wt, mpg, colour = hp)) +
 geom_point(size = 3) +
 scale_colour_nba("bucks", discrete = FALSE)
```
