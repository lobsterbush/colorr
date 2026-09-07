# ggplot2 scales from an NHL team palette

Colour and fill scales that take their colors from an NHL team, the
ggplot2 counterpart of
[`nhl.colors`](https://lobsterbush.github.io/colorr/reference/nhl.colors.md).
`scale_color_nhl` is an alias for `scale_colour_nhl`.

## Usage

``` r
scale_colour_nhl(set, discrete = TRUE, reverse = FALSE, legacy = FALSE, ...)

scale_color_nhl(set, discrete = TRUE, reverse = FALSE, legacy = FALSE, ...)

scale_fill_nhl(set, discrete = TRUE, reverse = FALSE, legacy = FALSE, ...)
```

## Arguments

- set:

  Character string naming an NHL team. See `colorr.teams("nhl")`.

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

[`nhl.colors`](https://lobsterbush.github.io/colorr/reference/nhl.colors.md)
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
 scale_fill_nhl("kraken")   # Seattle Kraken

ggplot(mtcars, aes(wt, mpg, colour = hp)) +
 geom_point(size = 3) +
 scale_colour_nhl("kraken", discrete = FALSE)
```
