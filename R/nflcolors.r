#--- NFL colors function --#
#'@title NFL colors
#'@description Returns a named character vector of hex colors for an NFL team. Teams cover
#'  the 2026 NFL season.
#'  Call \code{colorr.teams("nfl")} for the full list of team names.
#'@author Charles Crabtree \email{charles.crabtree@monash.edu}
#'@param set Character string naming an NFL team.
#'  The retired team name \code{"redskins"} still resolves, to the renamed franchise.
#'@param legacy Logical. If \code{TRUE}, return the palette that shipped with colorr
#'  1.0.1 instead of the current one, so older figures stay reproducible. Not every
#'  team has a legacy palette; teams added since 1.0.1 will throw an error.
#'@return Named character vector of hex color strings.
#'@seealso \code{\link{colorr.teams}} to list teams, \code{\link{scale_fill_nfl}} for the
#'  ggplot2 scales.
#'@examples
#'# Detroit Lions colors
#'pal <- nfl.colors("lions")
#'pal
#'pie(rep(1, length(pal)), labels = sprintf("%d (%s)", seq_along(pal), pal), col = pal)
#'
#'# Denver Broncos colors
#'nfl.colors("broncos")
#'
#'# the palette that shipped with colorr 1.0.1
#'nfl.colors("lions", legacy = TRUE)
#'@export

nfl.colors <- function(set = c("bears", "bengals", "bills", "broncos", "browns", "buccaneers",
                               "cardinals", "chargers", "chiefs", "colts", "commanders",
                               "cowboys", "dolphins", "eagles", "falcons", "giants", "jaguars",
                               "jets", "lions", "niners", "packers", "panthers", "patriots",
                               "raiders", "rams", "ravens", "redskins", "saints", "seahawks",
                               "steelers", "texans", "titans", "vikings"),
                       legacy = FALSE) {
  set <- match.arg(set)
  .colorr_pick(set, .colorr_palettes$nfl, .colorr_legacy$nfl, legacy, "NFL")
}
