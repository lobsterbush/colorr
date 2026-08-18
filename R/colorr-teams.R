#--- league and team discovery --#
#'@title Leagues covered by colorr
#'@description Returns the league codes colorr knows about. Every code is a valid
#'  \code{league} argument to \code{\link{colorr.teams}}, \code{\link{colorr.colors}} and
#'  \code{\link{colorr.pal}}. The pseudo-league \code{"soccer"} is also accepted by those
#'  functions and pools every soccer league into a single namespace.
#'@author Charles Crabtree \email{charles.crabtree@monash.edu}
#'@param soccer_only Logical. If \code{TRUE}, return only the soccer leagues.
#'@return Character vector of league codes.
#'@examples
#'colorr.leagues()
#'colorr.leagues(soccer_only = TRUE)
#'@export

colorr.leagues <- function(soccer_only = FALSE) {
  if (isTRUE(soccer_only)) return(.colorr_soccer_leagues())
  names(.colorr_leagues_meta)
}

#'@title Teams covered by colorr
#'@description Returns the team names accepted by a league's palette function. With no
#'  argument it returns a named list covering every league.
#'@author Charles Crabtree \email{charles.crabtree@monash.edu}
#'@param league Character string naming a league, as returned by
#'  \code{\link{colorr.leagues}}, or \code{"soccer"} for every soccer club at once. If
#'  \code{NULL} (the default), teams for all leagues are returned as a named list.
#'@return Character vector of team names, or a named list of them when \code{league} is
#'  \code{NULL}.
#'@examples
#'colorr.teams("wnba")
#'colorr.teams("ligue1")
#'
#'# how many teams each league contributes
#'lengths(colorr.teams())
#'@export

colorr.teams <- function(league = NULL) {
  pals <- .colorr_all_palettes()
  if (is.null(league)) return(lapply(pals, names))
  league <- match.arg(league, names(pals))
  names(pals[[league]])
}

#'@title Team colors from any league
#'@description League-agnostic version of \code{\link{epl.colors}} and friends: name the
#'  league and the team and get the palette back. Handy when the league is itself a variable.
#'@author Charles Crabtree \email{charles.crabtree@monash.edu}
#'@param league Character string naming a league, as returned by
#'  \code{\link{colorr.leagues}}, or \code{"soccer"} for every soccer club at once.
#'@param set Character string naming a team in that league. Team names retired since
#'  colorr 1.0.1, namely \code{"indians"} and \code{"redskins"}, still resolve to the
#'  renamed franchise.
#'@param legacy Logical. If \code{TRUE}, return the palette that shipped with colorr 1.0.1.
#'@return Named character vector of hex color strings.
#'@examples
#'colorr.colors("nhl", "kraken")
#'colorr.colors("soccer", "real_madrid")
#'
#'# the same palette either way
#'identical(colorr.colors("nba", "bucks"), nba.colors("bucks"))
#'@export

colorr.colors <- function(league, set, legacy = FALSE) {
  pals <- .colorr_all_palettes()
  league <- match.arg(league, names(pals))
  set <- match.arg(set, .colorr_choices(league, pals[[league]]))
  legacy_pals <- .colorr_all_legacy()[[league]]
  if (is.null(legacy_pals)) legacy_pals <- list()
  .colorr_pick(set, pals[[league]], legacy_pals, legacy, toupper(league))
}
