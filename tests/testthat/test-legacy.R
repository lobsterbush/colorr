test_that("legacy = TRUE returns the colorr 1.0.1 palettes", {
  expect_identical(
    epl.colors("arsenal", legacy = TRUE),
    c(Red = "#D01945", Blue = "#023975", Yellow = "#FFFF00", Gold = "#A18651")
  )
  expect_false(identical(epl.colors("arsenal"), epl.colors("arsenal", legacy = TRUE)))
})

test_that("every 1.0.1 team name still works", {
  old <- list(
    epl = c("arsenal", "bournemouth", "burnley", "chelsea", "crystal_palace", "everton",
            "hull", "leicester", "liverpool", "man_city", "man_united", "middlesbrough",
            "southampton", "stoke_city", "sunderland", "swansea_city", "tottenham",
            "watford", "west_bromich_albion", "west_ham"),
    mlb = c("diamondbacks", "braves", "orioles", "red_sox", "cubs", "white_sox", "reds",
            "indians", "rockies", "tigers", "astros", "royals", "angels", "dodgers",
            "marlins", "brewers", "twins", "mets", "yankees", "athletics", "phillies",
            "pirates", "padres", "giants", "mariners", "cardinals", "rays", "rangers",
            "blue_jays", "nationals"),
    nba = c("hawks", "hornets", "mavs", "warriors", "clippers", "heat", "pelicans",
            "magic", "blazers", "raptors", "celtics", "bulls", "nuggets", "rockets",
            "lakers", "bucks", "knicks", "sixers", "kings", "jazz", "nets", "cavs",
            "pistons", "pacers", "grizzlies", "wolves", "thunder", "suns", "spurs",
            "wizards", "sonics"),
    nfl = c("cardinals", "falcons", "ravens", "bills", "panthers", "bears", "bengals",
            "browns", "cowboys", "broncos", "lions", "packers", "texans", "colts",
            "jaguars", "chiefs", "chargers", "rams", "dolphins", "vikings", "patriots",
            "saints", "giants", "jets", "raiders", "eagles", "steelers", "niners",
            "seahawks", "buccaneers", "titans", "redskins"),
    nhl = c("ducks", "coyotes", "bruins", "sabres", "flames", "hurricanes", "blackhawks",
            "avalanche", "blue_jackets", "stars", "red_wings", "oilers", "panthers",
            "kings", "wild", "canadiens", "predators", "devils", "islanders", "rangers",
            "senators", "flyers", "penguins", "sharks", "blues", "lightning",
            "maple_leafs", "canucks", "golden_knights", "capitals", "jets")
  )
  for (lg in names(old)) {
    for (team in old[[lg]]) {
      label <- paste(lg, team, sep = "/")
      expect_match(colorr.colors(lg, team), "^#[0-9A-F]{6}$", all = TRUE, info = label)
      expect_match(colorr.colors(lg, team, legacy = TRUE), "^#[0-9A-F]{6}$",
                   all = TRUE, info = label)
    }
  }
})

test_that("teams added after 1.0.1 have no legacy palette", {
  expect_error(wnba.colors("valkyries", legacy = TRUE), "no legacy")
  expect_error(nhl.colors("utah", legacy = TRUE), "no legacy")
  expect_error(soccer.colors("real_madrid", legacy = TRUE), "no legacy")
})

test_that("the 1.0.1 Diamondbacks palette is reachable", {
  # colorr 1.0.1 misspelled the switch arm, so mlb.colors("diamondbacks") returned NULL
  expect_identical(
    mlb.colors("diamondbacks", legacy = TRUE),
    c(Red = "#A71930", Black = "#000000", Tan = "#E3D4AD")
  )
  expect_false(is.null(mlb.colors("diamondbacks")))
})
