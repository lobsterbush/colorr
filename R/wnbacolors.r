#--- WNBA colors function --#
#'@title WNBA colors
#'@description Returns a named character vector of hex colors for a WNBA team. Teams cover
#'  the 2026 WNBA season, including the Portland Fire and Toronto Tempo expansion teams.
#'  Call \code{colorr.teams("wnba")} for the full list of team names.
#'@author Charles Crabtree \email{charles.crabtree@monash.edu}
#'@param set Character string naming a WNBA team.
#'@param legacy Logical. Ignored for the WNBA; colorr 1.0.1 shipped no WNBA
#'  palettes. Kept so every colorr palette function takes the same arguments.
#'@return Named character vector of hex color strings.
#'@seealso \code{\link{colorr.teams}} to list teams, \code{\link{scale_fill_wnba}} for the
#'  ggplot2 scales.
#'@examples
#'# New York Liberty colors
#'pal <- wnba.colors("liberty")
#'pal
#'pie(rep(1, length(pal)), labels = sprintf("%d (%s)", seq_along(pal), pal), col = pal)
#'
#'# Golden State Valkyries colors
#'wnba.colors("valkyries")
#'@export

wnba.colors <- function(set = c("aces", "dream", "fever", "fire", "liberty", "lynx", "mercury",
                                "mystics", "sky", "sparks", "storm", "sun", "tempo",
                                "valkyries", "wings"),
                        legacy = FALSE) {
  set <- match.arg(set)
  .colorr_pick(set, .colorr_palettes$wnba, list(), legacy, "WNBA")
}
