# colorr

<div class="repllm-hero">
<p class="eyebrow">Research software · R package</p>
<p class="hero-title">Your team.<br>Your colours.</p>
<p class="hero-summary">Team palettes and ggplot2 scales for professional soccer, baseball, basketball, hockey, and football.</p>
<p class="hero-links"><a class="hero-primary" href="#quick-start">Get started ↗</a><a href="reference/index.html">Explore the reference →</a></p>
<p class="hero-meta">Charles Crabtree</p>
</div>

[![colorr: Human – AI (editor) 👤✏️🤖](reference/figures/provenance.svg)](https://thelatentreview.com/provenance/)

**Initial versions: entirely human-created.** AI was used only for later updates and code fixes.

## Quick start

```r
# Install the development version for the expanded league coverage.
install.packages("remotes")
remotes::install_github("lobsterbush/colorr")
library(colorr)

nba.colors("bucks")
soccer.colors("bayern_munich")
colorr.teams("wnba")
```

The CRAN release is available with `install.packages("colorr")`. This site
documents the development version; its league coverage can be newer than CRAN.

## From palette to plot

```r
library(ggplot2)

ggplot(mtcars, aes(factor(cyl), mpg, fill = factor(cyl))) +
  geom_boxplot() +
  scale_fill_nba("bucks")
```

Use a team palette directly as a named vector of hex colours, or add a colour
or fill scale to a ggplot. Set `discrete = FALSE` for continuous scales.

| Task | Function |
| --- | --- |
| Discover supported leagues | [`colorr.leagues()`](reference/colorr.leagues.html) |
| Find team names and keys | [`colorr.teams()`](reference/colorr.teams.html) |
| Select a palette by league and team | [`colorr.colors()`](reference/colorr.colors.html) |
| Create a palette function | [`colorr.pal()`](reference/colorr.pal.html) |

## Keep earlier figures reproducible

League palette functions accept `legacy = TRUE` to return the palettes from
colorr 1.0.1. For example, `epl.colors("man_united", legacy = TRUE)` selects
the older palette. See the reference for aliases and supported leagues.


## Provenance

**Human – AI (editor) 👤✏️🤖**

All initial versions were created entirely by the human authors, without AI.
AI was used only for subsequent updates and code fixes. This provenance
declaration is supplied by Charles Crabtree.

The label and mark follow [The Latent Review’s provenance standard](https://thelatentreview.com/provenance/),
shared under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/).
The software remains MIT licensed.

## Help and development

Report bugs or request features in the [issue tracker](https://github.com/lobsterbush/colorr/issues).
The [source and README](https://github.com/lobsterbush/colorr) include installation
requirements and local documentation build instructions.
