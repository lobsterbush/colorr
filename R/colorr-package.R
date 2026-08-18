#'@title colorr: color palettes for sports teams
#'@description colorr provides color palettes for professional sports teams as named
#'  character vectors of hex colors, and as ggplot2 colour and fill scales.
#'@details
#'  Palette functions, one per league:
#'  \code{\link{epl.colors}}, \code{\link{soccer.colors}}, \code{\link{mlb.colors}},
#'  \code{\link{nba.colors}}, \code{\link{wnba.colors}}, \code{\link{nfl.colors}} and
#'  \code{\link{nhl.colors}}. \code{\link{colorr.colors}} does the same job when the
#'  league is itself a variable.
#'
#'  To find out what is available, use \code{\link{colorr.leagues}} and
#'  \code{\link{colorr.teams}}.
#'
#'  For ggplot2, every league has \code{scale_colour_*}, \code{scale_color_*} and
#'  \code{scale_fill_*} constructors, e.g. \code{\link{scale_fill_nba}}. They are built
#'  on \code{\link{colorr.pal}}, which converts any team palette into a palette function.
#'
#'  Every palette function takes \code{legacy = TRUE}, which returns the palette that
#'  shipped with colorr 1.0.1 rather than the current-season one.
#'@keywords internal
"_PACKAGE"
