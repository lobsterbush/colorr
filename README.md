[![CRAN status](https://www.r-pkg.org/badges/version/colorr)](https://CRAN.R-project.org/package=colorr)
[![CRAN downloads](https://cranlogs.r-pkg.org/badges/grand-total/colorr)](https://CRAN.R-project.org/package=colorr)

# colorr: color palettes for sports teams

Color palettes for 276 professional sports teams across 11 leagues, as named character
vectors of hex colors and as ggplot2 colour and fill scales.

## Coverage

| Function | League | Teams |
| --- | --- | --- |
| `soccer.colors()` | All six soccer leagues below, in one namespace | 135 |
| `epl.colors()` | English Premier League (2026-27), plus every club from colorr 1.0.1 | 29 |
| `mlb.colors()` | Major League Baseball (2026) | 30 |
| `nba.colors()` | National Basketball Association (2026-27), plus the Seattle SuperSonics | 31 |
| `wnba.colors()` | Women's National Basketball Association (2026) | 15 |
| `nfl.colors()` | National Football League (2026) | 32 |
| `nhl.colors()` | National Hockey League (2026-27), plus the Arizona Coyotes | 33 |

`soccer.colors()` covers the Premier League (29), LaLiga (20), Serie A (20), the
Bundesliga (18), Ligue 1 (18) and Major League Soccer (30).

## Usage

```r
library(colorr)

nba.colors("bucks")
#> Good Land Green Cream City Cream Great Lakes Blue            Black
#>      "#00471B"        "#EEE1C6"        "#0077C0"        "#000000"

soccer.colors("bayern_munich")
#>      Blue       Red
#> "#0066B2" "#DC052D"
```

Use `colorr.leagues()` and `colorr.teams()` to see what's available, and
`colorr.colors()` when the league is itself a variable.

```r
colorr.teams("wnba")
lengths(colorr.teams())
colorr.colors("nhl", "kraken")
```

## ggplot2 scales

Every league has `scale_colour_*()`, `scale_color_*()` and `scale_fill_*()`
constructors.

```r
library(ggplot2)

ggplot(mtcars, aes(factor(cyl), mpg, fill = factor(cyl))) +
  geom_boxplot() +
  scale_fill_nba("bucks")

# continuous scales interpolate through the team's colors
ggplot(mtcars, aes(wt, mpg, colour = hp)) +
  geom_point(size = 3) +
  scale_colour_wnba("liberty", discrete = FALSE)
```

`colorr.pal()` returns the underlying palette function if you'd rather build the scale
yourself.

```r
pal <- colorr.pal("nfl", "lions")
pal(3)
pal(9)   # interpolated past the team's own colors
```

## Older palettes

Every palette function takes `legacy = TRUE`, which returns the palette that shipped with
colorr 1.0.1 rather than the current one, so figures made with older versions still
reproduce.

```r
epl.colors("man_united")
#>       Red    Yellow
#> "#DA291C" "#FBE122"

epl.colors("man_united", legacy = TRUE)
#>         Red      Yellow      Orange Dark Orange       Black
#>   "#D81A23"   "#F3CA07"   "#F4A614"   "#EF8221"   "#131313"
```

Teams that have been renamed since 1.0.1 still answer to their old names:
`mlb.colors("indians")` returns the Guardians palette, and `nfl.colors("redskins")`
returns the Commanders palette.

## Installation

The latest stable version can be installed from CRAN.

```r
install.packages("colorr")
```

The latest development version on GitHub can be installed using remotes.

```r
if (!require("remotes")) install.packages("remotes")
remotes::install_github("lobsterbush/colorr")
```

## Support or contact

Please use the [issue tracker](https://github.com/lobsterbush/colorr/issues) for problems,
questions, or feature requests. If you would rather email, you can contact
[Charles Crabtree](mailto:charles.crabtree@monash.edu).

If you would like to contribute to the package, that is great! I welcome pull requests and
new developers.

## Tests

`tests/testthat` checks that every palette is a valid, deduplicated, named hex vector,
that every team name from colorr 1.0.1 still resolves, and that the ggplot2 scales build.

```r
devtools::test()
```

## Credit

Some of the code from the functions comes from Karl W. Broman's `broman::brocolors`.

Team colors come mostly from [Team Color Codes](https://teamcolorcodes.com/). Clubs that
site hasn't caught up with, mostly those promoted into a top flight for 2026-27 and the
newest expansion franchises, come from
[BrandColorCode](https://www.brandcolorcode.com/), [FootyLogos](https://www.footylogos.com/),
[encycolorpedia](https://encycolorpedia.com/), Wikipedia's `Module:Sports color`, or the
clubs' own brand assets. `data-raw/provenance.json` records the source for every team, and
`data-raw/README.md` documents the pipeline.

Also, thanks to [Hadley Wickham](https://hadley.nz/) for his excellent book,
[_R Packages_](https://r-pkgs.org/).
