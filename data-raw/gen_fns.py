# -*- coding: utf-8 -*-
"""Generate colorr's per-league accessor functions and ggplot2 scales."""
import json, os
PKG = "/Users/f00421k/Documents/GitHub/colorr"
cur = json.load(open('current.json'))
choices = json.load(open('choices.json'))
soccer_keys = json.load(open('soccer_keys.json'))

def wrap_choices(keys, indent):
    pad = " " * indent
    lines, line = [], ""
    for k in keys:
        piece = '"%s", ' % k
        if len(line) + len(piece) + indent > 96:
            lines.append(line.rstrip())
            line = ""
        line += piece
    lines.append(line.rstrip().rstrip(","))
    return ("\n" + pad).join(lines)

RETIRED = {"mlb": ["indians"], "nfl": ["redskins"]}

ARTICLE = {"epl": "an", "mlb": "an", "nba": "an", "wnba": "a", "nfl": "an", "nhl": "an"}

SPEC = [
    ("epl",  "epl.colors",  "EPL",  "English Premier League",
     ["man_united", "tottenham"], "2026-27 Premier League season, plus every club that appeared in colorr 1.0.1"),
    ("mlb",  "mlb.colors",  "MLB",  "Major League Baseball",
     ["rockies", "mariners"], "2026 Major League Baseball season"),
    ("nba",  "nba.colors",  "NBA",  "National Basketball Association",
     ["pistons", "bucks"], "2026-27 NBA season, plus the Seattle SuperSonics"),
    ("wnba", "wnba.colors", "WNBA", "Women's National Basketball Association",
     ["liberty", "valkyries"], "2026 WNBA season, including the Portland Fire and Toronto Tempo expansion teams"),
    ("nfl",  "nfl.colors",  "NFL",  "National Football League",
     ["lions", "broncos"], "2026 NFL season"),
    ("nhl",  "nhl.colors",  "NHL",  "National Hockey League",
     ["ducks", "utah"], "2026-27 NHL season, plus the Arizona Coyotes"),
]

FILE = {"epl": "eplcolors.r", "mlb": "mlbcolors.r", "nba": "nbacolors.r",
        "wnba": "wnbacolors.r", "nfl": "nflcolors.r", "nhl": "nhlcolors.r"}

HAS_LEGACY = {"epl", "mlb", "nba", "nfl", "nhl"}

for lg, fname, abbr, full, ex, coverage in SPEC:
    keys = sorted(choices[lg] + RETIRED.get(lg, []))
    art = ARTICLE[lg]
    retired = RETIRED.get(lg, [])
    retired_txt = ("" if not retired else
        "#'  The retired team name " + " and ".join('\\code{"%s"}' % r for r in retired) +
        " still resolves, to the renamed franchise.\n")
    legacy_txt = (
        "#'@param legacy Logical. If \\code{TRUE}, return the palette that shipped with colorr\n"
        "#'  1.0.1 instead of the current one, so older figures stay reproducible. Not every\n"
        "#'  team has a legacy palette; teams added since 1.0.1 will throw an error.\n"
        if lg in HAS_LEGACY else
        "#'@param legacy Logical. Ignored for the " + abbr + "; colorr 1.0.1 shipped no " + abbr + "\n"
        "#'  palettes. Kept so every colorr palette function takes the same arguments.\n")
    legacy_ex = (f"#'\n#'# the palette that shipped with colorr 1.0.1\n"
                 f"#'{fname}(\"{ex[0]}\", legacy = TRUE)\n" if lg in HAS_LEGACY else "")
    legacy_arg = f".colorr_legacy${lg}" if lg in HAS_LEGACY else "list()"
    src = f'''#--- {abbr} colors function --#
#'@title {abbr} colors
#'@description Returns a named character vector of hex colors for {art} {abbr} team. Teams cover
#'  the {coverage}.
#'  Call \\code{{colorr.teams("{lg}")}} for the full list of team names.
#'@author Charles Crabtree \\email{{charles.crabtree@monash.edu}}
#'@param set Character string naming {art} {abbr} team.
{retired_txt}{legacy_txt}#'@return Named character vector of hex color strings.
#'@seealso \\code{{\\link{{colorr.teams}}}} to list teams, \\code{{\\link{{scale_fill_{lg}}}}} for the
#'  ggplot2 scales.
#'@examples
#'# {cur[lg][ex[0]]["name"]} colors
#'pal <- {fname}("{ex[0]}")
#'pal
#'pie(rep(1, length(pal)), labels = sprintf("%d (%s)", seq_along(pal), pal), col = pal)
#'
#'# {cur[lg][ex[1]]["name"]} colors
#'{fname}("{ex[1]}")
{legacy_ex}#'@export

{fname} <- function(set = c({wrap_choices(keys, len(fname) + 21)}),
{" " * (len(fname) + 13)}legacy = FALSE) {{
  set <- match.arg(set)
  .colorr_pick(set, .colorr_palettes${lg}, {legacy_arg}, legacy, "{abbr}")
}}
'''
    open(os.path.join(PKG, "R", FILE[lg]), "w").write(src)

# ------------------------------------------------------------------ soccer
soccer_leagues = ["epl", "laliga", "seriea", "bundesliga", "ligue1", "mls"]
counts = ", ".join(f"{'LaLiga' if l=='laliga' else 'Serie A' if l=='seriea' else 'Ligue 1' if l=='ligue1' else l.upper() if l in ('epl','mls') else l.capitalize()} ({len(cur[l])})" for l in soccer_leagues)
src = f'''#--- soccer colors function --#
#'@title Soccer colors
#'@description Returns a named character vector of hex colors for a soccer club. Covers every club
#'  in the {len(soccer_leagues)} leagues colorr tracks for the current season, plus the Premier League clubs that
#'  shipped with colorr 1.0.1: {counts}. Call \\code{{colorr.teams("soccer")}} for the
#'  full list, or \\code{{colorr.teams("laliga")}} for one league at a time.
#'@author Charles Crabtree \\email{{charles.crabtree@monash.edu}}
#'@param set Character string naming a soccer club.
#'@param legacy Logical. If \\code{{TRUE}}, return the palette that shipped with colorr 1.0.1.
#'  Only the 20 Premier League clubs in that release have legacy palettes.
#'@return Named character vector of hex color strings.
#'@seealso \\code{{\\link{{colorr.teams}}}} to list clubs, \\code{{\\link{{epl.colors}}}} for the
#'  Premier League on its own, \\code{{\\link{{scale_fill_soccer}}}} for the ggplot2 scales.
#'@examples
#'# Bayern Munich colors
#'pal <- soccer.colors("bayern_munich")
#'pal
#'pie(rep(1, length(pal)), labels = sprintf("%d (%s)", seq_along(pal), pal), col = pal)
#'
#'# Inter Miami colors
#'soccer.colors("inter_miami")
#'
#'# every LaLiga club colorr knows about
#'colorr.teams("laliga")
#'@export

soccer.colors <- function(set = c({wrap_choices(soccer_keys, 25)}),
                          legacy = FALSE) {{
  set <- match.arg(set)
  .colorr_pick(set, .colorr_soccer_palettes(), .colorr_legacy$epl, legacy, "soccer")
}}
'''
open(os.path.join(PKG, "R", "soccercolors.r"), "w").write(src)
print("wrote league functions + soccercolors.r")
