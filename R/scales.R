#--- ggplot2 interface --#
#'@title Team color palette generator
#'@description Turns a team palette into a palette function of the kind ggplot2 and
#'  \code{grDevices} expect: call it with \code{n} and it returns \code{n} colors. When
#'  \code{n} exceeds the number of colors the team actually has, the palette is interpolated
#'  with \code{\link[grDevices]{colorRampPalette}}.
#'@author Charles Crabtree \email{charles.crabtree@monash.edu}
#'@param league Character string naming a league, as returned by
#'  \code{\link{colorr.leagues}}, or \code{"soccer"} for every soccer club at once.
#'@param set Character string naming a team in that league.
#'@param reverse Logical. If \code{TRUE}, reverse the color order.
#'@param legacy Logical. If \code{TRUE}, build from the colorr 1.0.1 palette.
#'@return A function of one argument \code{n} returning a character vector of \code{n} hex
#'  colors.
#'@seealso \code{\link{scale_fill_nba}} and friends, which wrap this for ggplot2.
#'@examples
#'pal <- colorr.pal("nba", "bucks")
#'pal(3)
#'pal(8)  # interpolated past the team's own colors
#'@importFrom grDevices colorRampPalette
#'@export

colorr.pal <- function(league, set, reverse = FALSE, legacy = FALSE) {
  cols <- unname(colorr.colors(league, set, legacy = legacy))
  function(n) {
    out <- if (isTRUE(reverse)) rev(cols) else cols
    if (n > length(out)) out <- grDevices::colorRampPalette(out)(n)
    out[seq_len(n)]
  }
}

#'@noRd
.colorr_scale <- function(aesthetic, league, set, discrete, reverse, legacy, ...) {
  pal <- colorr.pal(league, set, reverse = reverse, legacy = legacy)
  if (isTRUE(discrete)) {
    return(ggplot2::discrete_scale(aesthetics = aesthetic, palette = pal, ...))
  }
  if (identical(aesthetic, "fill")) {
    ggplot2::scale_fill_gradientn(colours = pal(256), ...)
  } else {
    ggplot2::scale_colour_gradientn(colours = pal(256), ...)
  }
}


#'@title ggplot2 scales from an EPL team palette
#'@description Colour and fill scales that take their colors from an EPL team, the
#'  ggplot2 counterpart of \code{\link{epl.colors}}. \code{scale_color_epl} is an alias for
#'  \code{scale_colour_epl}.
#'@author Charles Crabtree \email{charles.crabtree@monash.edu}
#'@param set Character string naming an EPL team. See \code{colorr.teams("epl")}.
#'@param discrete Logical. \code{TRUE} (the default) builds a discrete scale;
#'  \code{FALSE} builds a continuous gradient through the team's colors.
#'@param reverse Logical. If \code{TRUE}, reverse the color order.
#'@param legacy Logical. If \code{TRUE}, use the palette that shipped with colorr 1.0.1.
#'@param ... Passed on to \code{\link[ggplot2]{discrete_scale}} when \code{discrete} is
#'  \code{TRUE}, otherwise to \code{\link[ggplot2]{scale_fill_gradientn}} or
#'  \code{\link[ggplot2]{scale_colour_gradientn}}.
#'@return A ggplot2 scale, to be added to a plot with \code{+}.
#'@seealso \code{\link{epl.colors}} for the raw palette, \code{\link{colorr.pal}} for the
#'  palette function.
#'@examples
#'library(ggplot2)
#'
#'ggplot(mtcars, aes(factor(cyl), mpg, fill = factor(cyl))) +
#'  geom_boxplot() +
#'  scale_fill_epl("man_united")   # Manchester United
#'
#'ggplot(mtcars, aes(wt, mpg, colour = hp)) +
#'  geom_point(size = 3) +
#'  scale_colour_epl("man_united", discrete = FALSE)
#'@name epl-scales
NULL

#'@rdname epl-scales
#'@export
scale_colour_epl <- function(set, discrete = TRUE, reverse = FALSE, legacy = FALSE, ...) {
  .colorr_scale("colour", "epl", set, discrete, reverse, legacy, ...)
}

#'@rdname epl-scales
#'@export
scale_color_epl <- function(set, discrete = TRUE, reverse = FALSE, legacy = FALSE, ...) {
  .colorr_scale("colour", "epl", set, discrete, reverse, legacy, ...)
}

#'@rdname epl-scales
#'@export
scale_fill_epl <- function(set, discrete = TRUE, reverse = FALSE, legacy = FALSE, ...) {
  .colorr_scale("fill", "epl", set, discrete, reverse, legacy, ...)
}


#'@title ggplot2 scales from an MLB team palette
#'@description Colour and fill scales that take their colors from an MLB team, the
#'  ggplot2 counterpart of \code{\link{mlb.colors}}. \code{scale_color_mlb} is an alias for
#'  \code{scale_colour_mlb}.
#'@author Charles Crabtree \email{charles.crabtree@monash.edu}
#'@param set Character string naming an MLB team. See \code{colorr.teams("mlb")}.
#'@param discrete Logical. \code{TRUE} (the default) builds a discrete scale;
#'  \code{FALSE} builds a continuous gradient through the team's colors.
#'@param reverse Logical. If \code{TRUE}, reverse the color order.
#'@param legacy Logical. If \code{TRUE}, use the palette that shipped with colorr 1.0.1.
#'@param ... Passed on to \code{\link[ggplot2]{discrete_scale}} when \code{discrete} is
#'  \code{TRUE}, otherwise to \code{\link[ggplot2]{scale_fill_gradientn}} or
#'  \code{\link[ggplot2]{scale_colour_gradientn}}.
#'@return A ggplot2 scale, to be added to a plot with \code{+}.
#'@seealso \code{\link{mlb.colors}} for the raw palette, \code{\link{colorr.pal}} for the
#'  palette function.
#'@examples
#'library(ggplot2)
#'
#'ggplot(mtcars, aes(factor(cyl), mpg, fill = factor(cyl))) +
#'  geom_boxplot() +
#'  scale_fill_mlb("rockies")   # Colorado Rockies
#'
#'ggplot(mtcars, aes(wt, mpg, colour = hp)) +
#'  geom_point(size = 3) +
#'  scale_colour_mlb("rockies", discrete = FALSE)
#'@name mlb-scales
NULL

#'@rdname mlb-scales
#'@export
scale_colour_mlb <- function(set, discrete = TRUE, reverse = FALSE, legacy = FALSE, ...) {
  .colorr_scale("colour", "mlb", set, discrete, reverse, legacy, ...)
}

#'@rdname mlb-scales
#'@export
scale_color_mlb <- function(set, discrete = TRUE, reverse = FALSE, legacy = FALSE, ...) {
  .colorr_scale("colour", "mlb", set, discrete, reverse, legacy, ...)
}

#'@rdname mlb-scales
#'@export
scale_fill_mlb <- function(set, discrete = TRUE, reverse = FALSE, legacy = FALSE, ...) {
  .colorr_scale("fill", "mlb", set, discrete, reverse, legacy, ...)
}


#'@title ggplot2 scales from an NBA team palette
#'@description Colour and fill scales that take their colors from an NBA team, the
#'  ggplot2 counterpart of \code{\link{nba.colors}}. \code{scale_color_nba} is an alias for
#'  \code{scale_colour_nba}.
#'@author Charles Crabtree \email{charles.crabtree@monash.edu}
#'@param set Character string naming an NBA team. See \code{colorr.teams("nba")}.
#'@param discrete Logical. \code{TRUE} (the default) builds a discrete scale;
#'  \code{FALSE} builds a continuous gradient through the team's colors.
#'@param reverse Logical. If \code{TRUE}, reverse the color order.
#'@param legacy Logical. If \code{TRUE}, use the palette that shipped with colorr 1.0.1.
#'@param ... Passed on to \code{\link[ggplot2]{discrete_scale}} when \code{discrete} is
#'  \code{TRUE}, otherwise to \code{\link[ggplot2]{scale_fill_gradientn}} or
#'  \code{\link[ggplot2]{scale_colour_gradientn}}.
#'@return A ggplot2 scale, to be added to a plot with \code{+}.
#'@seealso \code{\link{nba.colors}} for the raw palette, \code{\link{colorr.pal}} for the
#'  palette function.
#'@examples
#'library(ggplot2)
#'
#'ggplot(mtcars, aes(factor(cyl), mpg, fill = factor(cyl))) +
#'  geom_boxplot() +
#'  scale_fill_nba("bucks")   # Milwaukee Bucks
#'
#'ggplot(mtcars, aes(wt, mpg, colour = hp)) +
#'  geom_point(size = 3) +
#'  scale_colour_nba("bucks", discrete = FALSE)
#'@name nba-scales
NULL

#'@rdname nba-scales
#'@export
scale_colour_nba <- function(set, discrete = TRUE, reverse = FALSE, legacy = FALSE, ...) {
  .colorr_scale("colour", "nba", set, discrete, reverse, legacy, ...)
}

#'@rdname nba-scales
#'@export
scale_color_nba <- function(set, discrete = TRUE, reverse = FALSE, legacy = FALSE, ...) {
  .colorr_scale("colour", "nba", set, discrete, reverse, legacy, ...)
}

#'@rdname nba-scales
#'@export
scale_fill_nba <- function(set, discrete = TRUE, reverse = FALSE, legacy = FALSE, ...) {
  .colorr_scale("fill", "nba", set, discrete, reverse, legacy, ...)
}


#'@title ggplot2 scales from a WNBA team palette
#'@description Colour and fill scales that take their colors from a WNBA team, the
#'  ggplot2 counterpart of \code{\link{wnba.colors}}. \code{scale_color_wnba} is an alias for
#'  \code{scale_colour_wnba}.
#'@author Charles Crabtree \email{charles.crabtree@monash.edu}
#'@param set Character string naming a WNBA team. See \code{colorr.teams("wnba")}.
#'@param discrete Logical. \code{TRUE} (the default) builds a discrete scale;
#'  \code{FALSE} builds a continuous gradient through the team's colors.
#'@param reverse Logical. If \code{TRUE}, reverse the color order.
#'@param legacy Logical. If \code{TRUE}, use the palette that shipped with colorr 1.0.1.
#'@param ... Passed on to \code{\link[ggplot2]{discrete_scale}} when \code{discrete} is
#'  \code{TRUE}, otherwise to \code{\link[ggplot2]{scale_fill_gradientn}} or
#'  \code{\link[ggplot2]{scale_colour_gradientn}}.
#'@return A ggplot2 scale, to be added to a plot with \code{+}.
#'@seealso \code{\link{wnba.colors}} for the raw palette, \code{\link{colorr.pal}} for the
#'  palette function.
#'@examples
#'library(ggplot2)
#'
#'ggplot(mtcars, aes(factor(cyl), mpg, fill = factor(cyl))) +
#'  geom_boxplot() +
#'  scale_fill_wnba("liberty")   # New York Liberty
#'
#'ggplot(mtcars, aes(wt, mpg, colour = hp)) +
#'  geom_point(size = 3) +
#'  scale_colour_wnba("liberty", discrete = FALSE)
#'@name wnba-scales
NULL

#'@rdname wnba-scales
#'@export
scale_colour_wnba <- function(set, discrete = TRUE, reverse = FALSE, legacy = FALSE, ...) {
  .colorr_scale("colour", "wnba", set, discrete, reverse, legacy, ...)
}

#'@rdname wnba-scales
#'@export
scale_color_wnba <- function(set, discrete = TRUE, reverse = FALSE, legacy = FALSE, ...) {
  .colorr_scale("colour", "wnba", set, discrete, reverse, legacy, ...)
}

#'@rdname wnba-scales
#'@export
scale_fill_wnba <- function(set, discrete = TRUE, reverse = FALSE, legacy = FALSE, ...) {
  .colorr_scale("fill", "wnba", set, discrete, reverse, legacy, ...)
}


#'@title ggplot2 scales from an NFL team palette
#'@description Colour and fill scales that take their colors from an NFL team, the
#'  ggplot2 counterpart of \code{\link{nfl.colors}}. \code{scale_color_nfl} is an alias for
#'  \code{scale_colour_nfl}.
#'@author Charles Crabtree \email{charles.crabtree@monash.edu}
#'@param set Character string naming an NFL team. See \code{colorr.teams("nfl")}.
#'@param discrete Logical. \code{TRUE} (the default) builds a discrete scale;
#'  \code{FALSE} builds a continuous gradient through the team's colors.
#'@param reverse Logical. If \code{TRUE}, reverse the color order.
#'@param legacy Logical. If \code{TRUE}, use the palette that shipped with colorr 1.0.1.
#'@param ... Passed on to \code{\link[ggplot2]{discrete_scale}} when \code{discrete} is
#'  \code{TRUE}, otherwise to \code{\link[ggplot2]{scale_fill_gradientn}} or
#'  \code{\link[ggplot2]{scale_colour_gradientn}}.
#'@return A ggplot2 scale, to be added to a plot with \code{+}.
#'@seealso \code{\link{nfl.colors}} for the raw palette, \code{\link{colorr.pal}} for the
#'  palette function.
#'@examples
#'library(ggplot2)
#'
#'ggplot(mtcars, aes(factor(cyl), mpg, fill = factor(cyl))) +
#'  geom_boxplot() +
#'  scale_fill_nfl("lions")   # Detroit Lions
#'
#'ggplot(mtcars, aes(wt, mpg, colour = hp)) +
#'  geom_point(size = 3) +
#'  scale_colour_nfl("lions", discrete = FALSE)
#'@name nfl-scales
NULL

#'@rdname nfl-scales
#'@export
scale_colour_nfl <- function(set, discrete = TRUE, reverse = FALSE, legacy = FALSE, ...) {
  .colorr_scale("colour", "nfl", set, discrete, reverse, legacy, ...)
}

#'@rdname nfl-scales
#'@export
scale_color_nfl <- function(set, discrete = TRUE, reverse = FALSE, legacy = FALSE, ...) {
  .colorr_scale("colour", "nfl", set, discrete, reverse, legacy, ...)
}

#'@rdname nfl-scales
#'@export
scale_fill_nfl <- function(set, discrete = TRUE, reverse = FALSE, legacy = FALSE, ...) {
  .colorr_scale("fill", "nfl", set, discrete, reverse, legacy, ...)
}


#'@title ggplot2 scales from an NHL team palette
#'@description Colour and fill scales that take their colors from an NHL team, the
#'  ggplot2 counterpart of \code{\link{nhl.colors}}. \code{scale_color_nhl} is an alias for
#'  \code{scale_colour_nhl}.
#'@author Charles Crabtree \email{charles.crabtree@monash.edu}
#'@param set Character string naming an NHL team. See \code{colorr.teams("nhl")}.
#'@param discrete Logical. \code{TRUE} (the default) builds a discrete scale;
#'  \code{FALSE} builds a continuous gradient through the team's colors.
#'@param reverse Logical. If \code{TRUE}, reverse the color order.
#'@param legacy Logical. If \code{TRUE}, use the palette that shipped with colorr 1.0.1.
#'@param ... Passed on to \code{\link[ggplot2]{discrete_scale}} when \code{discrete} is
#'  \code{TRUE}, otherwise to \code{\link[ggplot2]{scale_fill_gradientn}} or
#'  \code{\link[ggplot2]{scale_colour_gradientn}}.
#'@return A ggplot2 scale, to be added to a plot with \code{+}.
#'@seealso \code{\link{nhl.colors}} for the raw palette, \code{\link{colorr.pal}} for the
#'  palette function.
#'@examples
#'library(ggplot2)
#'
#'ggplot(mtcars, aes(factor(cyl), mpg, fill = factor(cyl))) +
#'  geom_boxplot() +
#'  scale_fill_nhl("kraken")   # Seattle Kraken
#'
#'ggplot(mtcars, aes(wt, mpg, colour = hp)) +
#'  geom_point(size = 3) +
#'  scale_colour_nhl("kraken", discrete = FALSE)
#'@name nhl-scales
NULL

#'@rdname nhl-scales
#'@export
scale_colour_nhl <- function(set, discrete = TRUE, reverse = FALSE, legacy = FALSE, ...) {
  .colorr_scale("colour", "nhl", set, discrete, reverse, legacy, ...)
}

#'@rdname nhl-scales
#'@export
scale_color_nhl <- function(set, discrete = TRUE, reverse = FALSE, legacy = FALSE, ...) {
  .colorr_scale("colour", "nhl", set, discrete, reverse, legacy, ...)
}

#'@rdname nhl-scales
#'@export
scale_fill_nhl <- function(set, discrete = TRUE, reverse = FALSE, legacy = FALSE, ...) {
  .colorr_scale("fill", "nhl", set, discrete, reverse, legacy, ...)
}


#'@title ggplot2 scales from a soccer team palette
#'@description Colour and fill scales that take their colors from a soccer team, the
#'  ggplot2 counterpart of \code{\link{soccer.colors}}. \code{scale_color_soccer} is an alias for
#'  \code{scale_colour_soccer}.
#'@author Charles Crabtree \email{charles.crabtree@monash.edu}
#'@param set Character string naming a soccer team. See \code{colorr.teams("soccer")}.
#'@param discrete Logical. \code{TRUE} (the default) builds a discrete scale;
#'  \code{FALSE} builds a continuous gradient through the team's colors.
#'@param reverse Logical. If \code{TRUE}, reverse the color order.
#'@param legacy Logical. If \code{TRUE}, use the palette that shipped with colorr 1.0.1.
#'@param ... Passed on to \code{\link[ggplot2]{discrete_scale}} when \code{discrete} is
#'  \code{TRUE}, otherwise to \code{\link[ggplot2]{scale_fill_gradientn}} or
#'  \code{\link[ggplot2]{scale_colour_gradientn}}.
#'@return A ggplot2 scale, to be added to a plot with \code{+}.
#'@seealso \code{\link{soccer.colors}} for the raw palette, \code{\link{colorr.pal}} for the
#'  palette function.
#'@examples
#'library(ggplot2)
#'
#'ggplot(mtcars, aes(factor(cyl), mpg, fill = factor(cyl))) +
#'  geom_boxplot() +
#'  scale_fill_soccer("barcelona")   # FC Barcelona
#'
#'ggplot(mtcars, aes(wt, mpg, colour = hp)) +
#'  geom_point(size = 3) +
#'  scale_colour_soccer("barcelona", discrete = FALSE)
#'@name soccer-scales
NULL

#'@rdname soccer-scales
#'@export
scale_colour_soccer <- function(set, discrete = TRUE, reverse = FALSE, legacy = FALSE, ...) {
  .colorr_scale("colour", "soccer", set, discrete, reverse, legacy, ...)
}

#'@rdname soccer-scales
#'@export
scale_color_soccer <- function(set, discrete = TRUE, reverse = FALSE, legacy = FALSE, ...) {
  .colorr_scale("colour", "soccer", set, discrete, reverse, legacy, ...)
}

#'@rdname soccer-scales
#'@export
scale_fill_soccer <- function(set, discrete = TRUE, reverse = FALSE, legacy = FALSE, ...) {
  .colorr_scale("fill", "soccer", set, discrete, reverse, legacy, ...)
}
