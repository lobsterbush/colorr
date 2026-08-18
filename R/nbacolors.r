#--- NBA colors function --#
#'@title NBA colors
#'@description Returns a named character vector of hex colors for an NBA team. Teams cover
#'  the 2026-27 NBA season, plus the Seattle SuperSonics.
#'  Call \code{colorr.teams("nba")} for the full list of team names.
#'@author Charles Crabtree \email{charles.crabtree@monash.edu}
#'@param set Character string naming an NBA team.
#'@param legacy Logical. If \code{TRUE}, return the palette that shipped with colorr
#'  1.0.1 instead of the current one, so older figures stay reproducible. Not every
#'  team has a legacy palette; teams added since 1.0.1 will throw an error.
#'@return Named character vector of hex color strings.
#'@seealso \code{\link{colorr.teams}} to list teams, \code{\link{scale_fill_nba}} for the
#'  ggplot2 scales.
#'@examples
#'# Detroit Pistons colors
#'pal <- nba.colors("pistons")
#'pal
#'pie(rep(1, length(pal)), labels = sprintf("%d (%s)", seq_along(pal), pal), col = pal)
#'
#'# Milwaukee Bucks colors
#'nba.colors("bucks")
#'
#'# the palette that shipped with colorr 1.0.1
#'nba.colors("pistons", legacy = TRUE)
#'@export

nba.colors <- function(set = c("blazers", "bucks", "bulls", "cavs", "celtics", "clippers",
                               "grizzlies", "hawks", "heat", "hornets", "jazz", "kings",
                               "knicks", "lakers", "magic", "mavs", "nets", "nuggets",
                               "pacers", "pelicans", "pistons", "raptors", "rockets", "sixers",
                               "sonics", "spurs", "suns", "thunder", "warriors", "wizards",
                               "wolves"),
                       legacy = FALSE) {
  set <- match.arg(set)
  .colorr_pick(set, .colorr_palettes$nba, .colorr_legacy$nba, legacy, "NBA")
}
