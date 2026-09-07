# Soccer colors

Returns a named character vector of hex colors for a soccer club. Covers
every club in the six leagues colorr tracks for the current season, plus
the Premier League clubs that shipped with colorr 1.0.1: EPL (29),
LaLiga (20), Serie A (20), Bundesliga (18), Ligue 1 (18), MLS (30). Call
`colorr.teams("soccer")` for the full list, or `colorr.teams("laliga")`
for one league at a time.

## Usage

``` r
soccer.colors(
  set = c("alaves", "angers", "arsenal", "aston_villa", "atalanta", "athletic_bilbao",
    "atlanta_united", "atletico_madrid", "augsburg", "austin", "auxerre", "barcelona",
    "bayern_munich", "bologna", "bournemouth", "brentford", "brest", "brighton",
    "burnley", "cagliari", "celta_vigo", "cf_montreal", "charlotte", "chelsea",
    "chicago_fire", "colorado_rapids", "columbus_crew", "como", "coventry_city",
    "crystal_palace", "dc_united", "deportivo", "dortmund", "eintracht_frankfurt",
    "elche", "elversberg", "espanyol", 
     "everton", "fc_cincinnati", "fc_dallas",
    "fiorentina", "freiburg", "frosinone", "fulham", "genoa", "getafe", "hamburg",
    "hoffenheim", "houston_dynamo", "hull", "inter", "inter_miami", "ipswich_town",
    "juventus", "koln", "la_galaxy", "lafc", "lazio", "le_havre", "le_mans", "lecce",
    "leeds_united", "leicester", "leipzig", "lens", "levante", "leverkusen", "lille",
    "liverpool", "lorient", "lyon", "mainz", "malaga", "man_city", "man_united",
    "marseille", "middlesbrough", "milan", "minnesota_united", 
     "monaco",
    "monchengladbach", "monza", "napoli", "nashville", "new_england", "newcastle",
    "nice", "nottingham_forest", "ny_red_bulls", "nycfc", "orlando_city", "osasuna",
    "paderborn", "paris_fc", "parma", "philadelphia_union", "portland_timbers", "psg",
    "racing_santander", "rayo_vallecano", "real_betis", "real_madrid", "real_salt_lake",
    "real_sociedad", "rennes", "roma", "san_diego", "san_jose", "sassuolo", "schalke",
    "seattle_sounders", "sevilla", "southampton", "sporting_kc", "st_louis_city", 
    
    "stoke_city", "strasbourg", "stuttgart", "sunderland", "swansea_city", "torino",
    "toronto_fc", "tottenham", "toulouse", "troyes", "udinese", "union_berlin",
    "valencia", "vancouver", "venezia", "villarreal", "watford", "werder_bremen",
    "west_bromich_albion", "west_ham"),
  legacy = FALSE
)
```

## Arguments

- set:

  Character string naming a soccer club.

- legacy:

  Logical. If `TRUE`, return the palette that shipped with colorr 1.0.1.
  Only the 20 Premier League clubs in that release have legacy palettes.

## Value

Named character vector of hex color strings.

## See also

[`colorr.teams`](https://lobsterbush.github.io/colorr/reference/colorr.teams.md)
to list clubs,
[`epl.colors`](https://lobsterbush.github.io/colorr/reference/epl.colors.md)
for the Premier League on its own,
[`scale_fill_soccer`](https://lobsterbush.github.io/colorr/reference/soccer-scales.md)
for the ggplot2 scales.

## Author

Charles Crabtree <charles.crabtree@monash.edu>

## Examples

``` r
# Bayern Munich colors
pal <- soccer.colors("bayern_munich")
pal
pie(rep(1, length(pal)), labels = sprintf("%d (%s)", seq_along(pal), pal), col = pal)

# Inter Miami colors
soccer.colors("inter_miami")

# every LaLiga club colorr knows about
colorr.teams("laliga")
```
