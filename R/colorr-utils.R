#--- internal helpers --#

# Franchises that were renamed after colorr 1.0.1. The old team name still resolves, to
# the renamed franchise's current palette, so code written against 1.0.1 keeps working.
#' @noRd
.colorr_renamed <- list(
  mlb = c(indians = "guardians"),
  nfl = c(redskins = "commanders")
)

#' @noRd
.colorr_resolve <- function(set, league) {
  alias <- .colorr_renamed[[tolower(league)]]
  if (!is.null(alias) && set %in% names(alias)) return(unname(alias[[set]]))
  set
}

#' @noRd
.colorr_choices <- function(league, pals) {
  sort(c(names(pals), names(.colorr_renamed[[tolower(league)]])))
}

#' @noRd
.colorr_pick <- function(set, current, legacy_pals, legacy, league) {
  if (isTRUE(legacy)) {
    pal <- legacy_pals[[set]]
    if (is.null(pal)) {
      stop("no legacy (colorr 1.0.1) palette for \"", set, "\" in ", league, ".\n",
           "  legacy palettes are available for: ",
           paste(names(legacy_pals), collapse = ", "),
           call. = FALSE)
    }
    return(pal)
  }
  current[[.colorr_resolve(set, league)]]
}

#' @noRd
.colorr_soccer_leagues <- function() {
  names(Filter(function(x) isTRUE(x$soccer), .colorr_leagues_meta))
}

#' @noRd
.colorr_soccer_palettes <- function() {
  do.call(c, unname(.colorr_palettes[.colorr_soccer_leagues()]))
}

#' @noRd
.colorr_all_palettes <- function() {
  c(.colorr_palettes, list(soccer = .colorr_soccer_palettes()))
}

#' @noRd
.colorr_all_legacy <- function() {
  c(.colorr_legacy, list(soccer = .colorr_legacy$epl))
}
