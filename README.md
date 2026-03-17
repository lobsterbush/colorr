[![CRAN status](https://www.r-pkg.org/badges/version/colorr)](https://CRAN.R-project.org/package=colorr)
[![CRAN downloads](https://cranlogs.r-pkg.org/badges/grand-total/colorr)](https://CRAN.R-project.org/package=colorr)

# colorr: Color palettes for EPL, MLB, NBA, NHL, and NFL teams.

Color palettes for EPL, MLB, NBA, NHL, and NFL teams. The package contains the following palettes.

## Color palettes
- `epl.colors` includes the color palettes for all English Premier League teams playing in the 2016-17 season.
- `mlb.colors` includes the color palettes for all Major League Baseball teams playing in the 2016 season.
- `nba.colors` includes the color palettes for all National Basketball Association teams playing in the 2016-17 season, as well as the colors for the Seattle Supersonics. 
- `nfl.colors` includes the color palettes for all National Football League teams that played in the 2016 season.
- `nhl.colors` includes the color palettes for all National Hockey League teams playing in the 2016-17 season.

## Package Installation
The latest stable version can be installed from CRAN.
```r
install.packages("colorr")
```

The latest development version on GitHub can be installed using remotes.
```r
if (!require("remotes")) install.packages("remotes")
remotes::install_github("cdcrabtree/colorr")
```

## Support or Contact
Please use the [issue tracker](https://github.com/cdcrabtree/colorr/issues) for problems, questions, or feature requests. If you would rather email, you can contact [Charles Crabtree](mailto:charles.crabtree@monash.edu).

If you would like to contribute to the package, that is great! I welcome pull requests and new developers.

## Tests
To test the software, users and potential contributors can use the example code provided in the documentation for each function.

## Credit
Some of the code from the functions comes from Karl W. Broman's `broman::brocolors`. Team colors come from [https://teamcolors.jim-nielsen.com/](https://teamcolors.jim-nielsen.com/) and [https://teamcolorcodes.com/nba-team-color-codes/](https://teamcolorcodes.com/nba-team-color-codes/).

Also, thanks to [Hadley Wickham](https://hadley.nz/) for his excellent book, [_R Packages_](https://r-pkgs.org/).
