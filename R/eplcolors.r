#--- EPL colors function --#
#'@title EPL colors
#'@description Returns a named character vector of hex colors for an EPL team. Teams cover
#'  the 2026-27 Premier League season, plus every club that appeared in colorr 1.0.1.
#'  Call \code{colorr.teams("epl")} for the full list of team names.
#'@author Charles Crabtree \email{charles.crabtree@monash.edu}
#'@param set Character string naming an EPL team.
#'@param legacy Logical. If \code{TRUE}, return the palette that shipped with colorr
#'  1.0.1 instead of the current one, so older figures stay reproducible. Not every
#'  team has a legacy palette; teams added since 1.0.1 will throw an error.
#'@return Named character vector of hex color strings.
#'@seealso \code{\link{colorr.teams}} to list teams, \code{\link{scale_fill_epl}} for the
#'  ggplot2 scales.
#'@examples
#'# Manchester United colors
#'pal <- epl.colors("man_united")
#'pal
#'pie(rep(1, length(pal)), labels = sprintf("%d (%s)", seq_along(pal), pal), col = pal)
#'
#'# Tottenham Hotspur colors
#'epl.colors("tottenham")
#'
#'# the palette that shipped with colorr 1.0.1
#'epl.colors("man_united", legacy = TRUE)
#'@export

epl.colors <- function(set = c("arsenal", "aston_villa", "bournemouth", "brentford",
                               "brighton", "burnley", "chelsea", "coventry_city",
                               "crystal_palace", "everton", "fulham", "hull", "ipswich_town",
                               "leeds_united", "leicester", "liverpool", "man_city",
                               "man_united", "middlesbrough", "newcastle", "nottingham_forest",
                               "southampton", "stoke_city", "sunderland", "swansea_city",
                               "tottenham", "watford", "west_bromich_albion", "west_ham"),
                       legacy = FALSE) {
  set <- match.arg(set)
  .colorr_pick(set, .colorr_palettes$epl, .colorr_legacy$epl, legacy, "EPL")
}
