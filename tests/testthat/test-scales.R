test_that("colorr.pal() returns n colors and interpolates when asked for more", {
  pal <- colorr.pal("nba", "bucks")
  n <- length(nba.colors("bucks"))
  expect_length(pal(2), 2)
  expect_identical(pal(n), unname(nba.colors("bucks")))
  expect_length(pal(n + 5), n + 5)
  expect_match(pal(n + 5), "^#[0-9A-F]{6}$", all = TRUE, ignore.case = TRUE)
})

test_that("reverse flips the color order", {
  expect_identical(
    colorr.pal("nhl", "kraken", reverse = TRUE)(3),
    rev(unname(nhl.colors("kraken")))[1:3]
  )
})

test_that("scales are ggplot2 scales and attach to a plot", {
  skip_if_not_installed("ggplot2")
  for (f in list(scale_fill_nba, scale_colour_nba, scale_color_nba)) {
    expect_s3_class(f("bucks"), "Scale")
    expect_s3_class(f("bucks", discrete = FALSE), "Scale")
  }
  p <- ggplot2::ggplot(mtcars, ggplot2::aes(factor(cyl), mpg, fill = factor(cyl))) +
    ggplot2::geom_boxplot() +
    scale_fill_wnba("liberty")
  expect_s3_class(ggplot2::ggplot_build(p), "ggplot_built")
})

test_that("every league has a matching set of scale constructors", {
  for (lg in c("epl", "mlb", "nba", "wnba", "nfl", "nhl", "soccer")) {
    for (prefix in c("scale_fill_", "scale_colour_", "scale_color_")) {
      expect_true(exists(paste0(prefix, lg), envir = asNamespace("colorr")),
                  info = paste0(prefix, lg))
    }
  }
})
