#--- MLB colors function --#
#'@title MLB colors
#'@description Returns a named character vector of hex colors for an MLB team. Teams cover
#'  the 2026 Major League Baseball season.
#'  Call \code{colorr.teams("mlb")} for the full list of team names.
#'@author Charles Crabtree \email{charles.crabtree@monash.edu}
#'@param set Character string naming an MLB team.
#'  The retired team name \code{"indians"} still resolves, to the renamed franchise.
#'@param legacy Logical. If \code{TRUE}, return the palette that shipped with colorr
#'  1.0.1 instead of the current one, so older figures stay reproducible. Not every
#'  team has a legacy palette; teams added since 1.0.1 will throw an error.
#'@return Named character vector of hex color strings.
#'@seealso \code{\link{colorr.teams}} to list teams, \code{\link{scale_fill_mlb}} for the
#'  ggplot2 scales.
#'@examples
#'# Colorado Rockies colors
#'pal <- mlb.colors("rockies")
#'pal
#'pie(rep(1, length(pal)), labels = sprintf("%d (%s)", seq_along(pal), pal), col = pal)
#'
#'# Seattle Mariners colors
#'mlb.colors("mariners")
#'
#'# the palette that shipped with colorr 1.0.1
#'mlb.colors("rockies", legacy = TRUE)
#'@export

mlb.colors <- function(set = c("angels", "astros", "athletics", "blue_jays", "braves",
                               "brewers", "cardinals", "cubs", "diamondbacks", "dodgers",
                               "giants", "guardians", "indians", "mariners", "marlins", "mets",
                               "nationals", "orioles", "padres", "phillies", "pirates",
                               "rangers", "rays", "red_sox", "reds", "rockies", "royals",
                               "tigers", "twins", "white_sox", "yankees"),
                       legacy = FALSE) {
  set <- match.arg(set)
  .colorr_pick(set, .colorr_palettes$mlb, .colorr_legacy$mlb, legacy, "MLB")
}
