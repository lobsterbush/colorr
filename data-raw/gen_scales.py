# -*- coding: utf-8 -*-
"""Generate colorr's ggplot2 scale constructors."""
import os
PKG = "/Users/f00421k/Documents/GitHub/colorr"

LEAGUES = [
    ("epl",    "EPL",    "epl.colors",    "man_united", "Manchester United"),
    ("mlb",    "MLB",    "mlb.colors",    "rockies",    "Colorado Rockies"),
    ("nba",    "NBA",    "nba.colors",    "bucks",      "Milwaukee Bucks"),
    ("wnba",   "WNBA",   "wnba.colors",   "liberty",    "New York Liberty"),
    ("nfl",    "NFL",    "nfl.colors",    "lions",      "Detroit Lions"),
    ("nhl",    "NHL",    "nhl.colors",    "kraken",     "Seattle Kraken"),
    ("soccer", "soccer", "soccer.colors", "barcelona",  "FC Barcelona"),
]
ART = {"epl": "an", "mlb": "an", "nba": "an", "wnba": "a", "nfl": "an", "nhl": "an",
       "soccer": "a"}

head = '''#--- ggplot2 interface --#
#'@title Team color palette generator
#'@description Turns a team palette into a palette function of the kind ggplot2 and
#'  \\code{grDevices} expect: call it with \\code{n} and it returns \\code{n} colors. When
#'  \\code{n} exceeds the number of colors the team actually has, the palette is interpolated
#'  with \\code{\\link[grDevices]{colorRampPalette}}.
#'@author Charles Crabtree \\email{charles.crabtree@monash.edu}
#'@param league Character string naming a league, as returned by
#'  \\code{\\link{colorr.leagues}}, or \\code{"soccer"} for every soccer club at once.
#'@param set Character string naming a team in that league.
#'@param reverse Logical. If \\code{TRUE}, reverse the color order.
#'@param legacy Logical. If \\code{TRUE}, build from the colorr 1.0.1 palette.
#'@return A function of one argument \\code{n} returning a character vector of \\code{n} hex
#'  colors.
#'@seealso \\code{\\link{scale_fill_nba}} and friends, which wrap this for ggplot2.
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
'''

blocks = [head]
for lg, abbr, fn, ex, exlabel in LEAGUES:
    art = ART[lg]
    doc = f'''
#'@title ggplot2 scales from {art} {abbr} team palette
#'@description Colour and fill scales that take their colors from {art} {abbr} team, the
#'  ggplot2 counterpart of \\code{{\\link{{{fn}}}}}. \\code{{scale_color_{lg}}} is an alias for
#'  \\code{{scale_colour_{lg}}}.
#'@author Charles Crabtree \\email{{charles.crabtree@monash.edu}}
#'@param set Character string naming {art} {abbr} team. See \\code{{colorr.teams("{lg}")}}.
#'@param discrete Logical. \\code{{TRUE}} (the default) builds a discrete scale;
#'  \\code{{FALSE}} builds a continuous gradient through the team's colors.
#'@param reverse Logical. If \\code{{TRUE}}, reverse the color order.
#'@param legacy Logical. If \\code{{TRUE}}, use the palette that shipped with colorr 1.0.1.
#'@param ... Passed on to \\code{{\\link[ggplot2]{{discrete_scale}}}} when \\code{{discrete}} is
#'  \\code{{TRUE}}, otherwise to \\code{{\\link[ggplot2]{{scale_fill_gradientn}}}} or
#'  \\code{{\\link[ggplot2]{{scale_colour_gradientn}}}}.
#'@return A ggplot2 scale, to be added to a plot with \\code{{+}}.
#'@seealso \\code{{\\link{{{fn}}}}} for the raw palette, \\code{{\\link{{colorr.pal}}}} for the
#'  palette function.
#'@examples
#'library(ggplot2)
#'
#'ggplot(mtcars, aes(factor(cyl), mpg, fill = factor(cyl))) +
#'  geom_boxplot() +
#'  scale_fill_{lg}("{ex}")   # {exlabel}
#'
#'ggplot(mtcars, aes(wt, mpg, colour = hp)) +
#'  geom_point(size = 3) +
#'  scale_colour_{lg}("{ex}", discrete = FALSE)
#'@name {lg}-scales
NULL

#'@rdname {lg}-scales
#'@export
scale_colour_{lg} <- function(set, discrete = TRUE, reverse = FALSE, legacy = FALSE, ...) {{
  .colorr_scale("colour", "{lg}", set, discrete, reverse, legacy, ...)
}}

#'@rdname {lg}-scales
#'@export
scale_color_{lg} <- function(set, discrete = TRUE, reverse = FALSE, legacy = FALSE, ...) {{
  .colorr_scale("colour", "{lg}", set, discrete, reverse, legacy, ...)
}}

#'@rdname {lg}-scales
#'@export
scale_fill_{lg} <- function(set, discrete = TRUE, reverse = FALSE, legacy = FALSE, ...) {{
  .colorr_scale("fill", "{lg}", set, discrete, reverse, legacy, ...)
}}
'''
    blocks.append(doc)

open(os.path.join(PKG, "R", "scales.R"), "w").write("\n".join(blocks))
print("wrote scales.R:", sum(1 for _ in open(os.path.join(PKG,"R","scales.R"))), "lines")
