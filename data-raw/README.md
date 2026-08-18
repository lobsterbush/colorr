# data-raw

The scripts that build `R/palettes-current.R`, `R/palettes-legacy.R`, `R/leagues.R`, the
per-league palette functions and `R/scales.R`. Nothing here ships in the built package.

## Pipeline

1. **Rosters.** Current-season team lists come from the Wikipedia season articles
   (2026-27 Premier League, LaLiga, Serie A, Bundesliga, Ligue 1, NBA and NHL; 2026 MLS,
   MLB, NFL and WNBA). They are recorded by hand in `roster.py` and `us_roster.py`.
2. **Palettes.** `parse_pages.py` scrapes the primary palette from each team's page on
   teamcolorcodes.com, stopping at the first heading that describes a historical,
   throwback or alternate identity. `parse_alt.py` does the same for the fallback
   sources. `build_data.py` joins rosters to palettes and writes `current.json`.
3. **Legacy.** `parse_legacy.py` reads the colorr 1.0.1 palettes straight out of the
   1.0.1 R sources and writes `legacy.json`.
4. **Codegen.** `gen_r.py`, `gen_fns.py` and `gen_scales.py` write the R files. Run
   `roxygen2::roxygenise(".")` afterwards.

## Sources

`provenance.json` records the source used for every team. In summary:

| Source | Teams |
| --- | --- |
| [teamcolorcodes.com](https://teamcolorcodes.com/) | 248 |
| [brandcolorcode.com](https://www.brandcolorcode.com/) | 14 |
| [footylogos.com](https://www.footylogos.com/) | 3 |
| [encycolorpedia.com](https://encycolorpedia.com/) logo colours | 3 |
| Official club sites (Racing Santander, SV Elversberg, Le Mans FC, and the Golden State Valkyries, Portland Fire and Toronto Tempo brand CSS) | 6 |
| Wikipedia `Module:Sports color/ice hockey` (Utah Mammoth) | 1 |

Teams outside teamcolorcodes.com are mostly clubs promoted into a top flight for
2026-27 and the newest expansion franchises, which the aggregators have not caught up
with yet.
