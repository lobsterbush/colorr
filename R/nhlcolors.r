#--- NHL colors function --#
#'@title NHL colors
#'@description Returns a named character vector of hex colors for an NHL team. Teams cover
#'  the 2026-27 NHL season, plus the Arizona Coyotes.
#'  Call \code{colorr.teams("nhl")} for the full list of team names.
#'@author Charles Crabtree \email{charles.crabtree@monash.edu}
#'@param set Character string naming an NHL team.
#'@param legacy Logical. If \code{TRUE}, return the palette that shipped with colorr
#'  1.0.1 instead of the current one, so older figures stay reproducible. Not every
#'  team has a legacy palette; teams added since 1.0.1 will throw an error.
#'@return Named character vector of hex color strings.
#'@seealso \code{\link{colorr.teams}} to list teams, \code{\link{scale_fill_nhl}} for the
#'  ggplot2 scales.
#'@examples
#'# Anaheim Ducks colors
#'pal <- nhl.colors("ducks")
#'pal
#'pie(rep(1, length(pal)), labels = sprintf("%d (%s)", seq_along(pal), pal), col = pal)
#'
#'# Utah Mammoth colors
#'nhl.colors("utah")
#'
#'# the palette that shipped with colorr 1.0.1
#'nhl.colors("ducks", legacy = TRUE)
#'@export

nhl.colors <- function(set = c("avalanche", "blackhawks", "blue_jackets", "blues", "bruins",
                               "canadiens", "canucks", "capitals", "coyotes", "devils",
                               "ducks", "flames", "flyers", "golden_knights", "hurricanes",
                               "islanders", "jets", "kings", "kraken", "lightning",
                               "maple_leafs", "oilers", "panthers", "penguins", "predators",
                               "rangers", "red_wings", "sabres", "senators", "sharks", "stars",
                               "utah", "wild"),
                       legacy = FALSE) {
  set <- match.arg(set)
  .colorr_pick(set, .colorr_palettes$nhl, .colorr_legacy$nhl, legacy, "NHL")
}
