test_that("every palette is a named vector of valid hex colors", {
  for (lg in colorr.leagues()) {
    for (team in colorr.teams(lg)) {
      pal <- colorr.colors(lg, team)
      label <- paste(lg, team, sep = "/")
      expect_true(is.character(pal), info = label)
      expect_gt(length(pal), 0)
      expect_match(pal, "^#[0-9A-F]{6}$", all = TRUE, info = label)
      expect_false(anyDuplicated(pal) > 0, info = label)
      expect_true(all(nzchar(names(pal))), info = label)
    }
  }
})

test_that("league functions agree with colorr.colors()", {
  pairs <- list(epl = epl.colors, mlb = mlb.colors, nba = nba.colors,
                wnba = wnba.colors, nfl = nfl.colors, nhl = nhl.colors,
                soccer = soccer.colors)
  for (lg in names(pairs)) {
    team <- colorr.teams(lg)[[1]]
    expect_identical(pairs[[lg]](team), colorr.colors(lg, team))
  }
})

test_that("current-season rosters are the expected size", {
  expect_length(colorr.teams("mlb"), 30)
  expect_length(colorr.teams("nba"), 31)   # 30 current teams plus the SuperSonics
  expect_length(colorr.teams("wnba"), 15)
  expect_length(colorr.teams("nfl"), 32)
  expect_length(colorr.teams("nhl"), 33)   # 32 current teams plus the Coyotes
  expect_length(colorr.teams("laliga"), 20)
  expect_length(colorr.teams("seriea"), 20)
  expect_length(colorr.teams("bundesliga"), 18)
  expect_length(colorr.teams("ligue1"), 18)
  expect_length(colorr.teams("mls"), 30)
  expect_length(colorr.teams("soccer"), 135)
})

test_that("soccer team names are unique across leagues", {
  soccer <- unlist(colorr.teams()[colorr.leagues(soccer_only = TRUE)], use.names = FALSE)
  expect_false(anyDuplicated(soccer) > 0)
  expect_setequal(soccer, colorr.teams("soccer"))
})

test_that("teams renamed since 1.0.1 resolve to their current identity", {
  expect_identical(mlb.colors("guardians"), colorr.colors("mlb", "guardians"))
  expect_true("commanders" %in% colorr.teams("nfl"))
  expect_true("utah" %in% colorr.teams("nhl"))
  expect_true("valkyries" %in% colorr.teams("wnba"))
})
