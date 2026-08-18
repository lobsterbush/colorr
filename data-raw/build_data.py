# -*- coding: utf-8 -*-
"""Assemble the final current-season palette table for every league."""
import json, re, unicodedata
import roster, us_roster

parsed = json.load(open('parsed.json'))
alt = json.load(open('alt_parsed.json'))

def ascii_(s):
    s = unicodedata.normalize('NFKD', s)
    return ''.join(c for c in s if not unicodedata.combining(c)).encode('ascii', 'ignore').decode()

def titlecase(n):
    n = ascii_(n).strip()
    small = {'and','of','the'}
    parts = n.split()
    out = []
    for i, p in enumerate(parts):
        if p.isupper() and len(p) > 1:
            p = p.capitalize()
        elif p.islower():
            p = p.capitalize()
        if i and p.lower() in small: p = p.lower()
        out.append(p)
    return ' '.join(out)

def clean(cols):
    seen, out = set(), []
    for n, h in cols:
        h = h.upper()
        if h in seen: continue
        seen.add(h)
        out.append([titlecase(n), h])
    return out

# ---- manual fills, with the source each came from -------------------------
MANUAL = {

 # WNBA expansion clubs, from the clubs' official wnba.com brand CSS
 ("wnba","valkyries"): ([["Valkyrie Violet","#B896D4"],["Light Violet","#C6ABDD"],["Black","#000000"],["Gold","#B9975B"],["White","#FFFFFF"]],
                  "valkyries.wnba.com brand CSS"),
 ("wnba","tempo"): ([["Bordeaux","#441E36"],["Dark Bordeaux","#35182B"],["Borealis Blue","#B3C7E7"],["Black","#000000"],["White","#FFFFFF"]],
                  "tempo.wnba.com brand CSS"),
 ("wnba","fire"): ([["Black","#000000"],["Soft Black","#1B1B1B"],["Red","#C8102E"],["Pale Blue","#CEE5EB"],["White","#FFFFFF"]],
                  "fire.wnba.com brand CSS"),
 # NHL
 ("nhl","utah"): ([["Rock Black","#010101"],["Salt White","#FFFFFF"],["Mountain Blue","#7AB2E0"]],
                  "Wikipedia Module:Sports color/ice hockey"),
 # soccer, from encycolorpedia logo colours
 ("epl","ipswich_town"): ([["Blue","#3A64A3"],["Red","#DE2C37"],["White","#FEFEFE"]],
                  "encycolorpedia.com logo colours"),
 ("laliga","malaga"): (None, "encycolorpedia.com logo colours"),
 ("bundesliga","paderborn"): (None, "encycolorpedia.com logo colours"),
 # soccer, from official club sites
 ("laliga","racing_santander"): ([["Green","#45AC34"],["Dark Green","#1C5733"],["White","#FFFFFF"]],
                  "realracingclub.es brand palette"),
 ("bundesliga","elversberg"): ([["Gold","#C8B885"],["Black","#141414"],["White","#FFFFFF"]],
                  "sv07elversberg.de brand palette"),
 ("ligue1","le_mans"): ([["Red","#D60000"],["Yellow","#FECB00"],["Dark Grey","#343434"]],
                  "lemansfc.fr brand palette"),
}
ALT_MAP = {
 ("epl","brentford"):"bc_brentford-f-c", ("epl","sunderland"):"fl_sunderland",
 ("laliga","elche"):"bc_elche-cf", ("laliga","rayo_vallecano"):"fl_rayo-vallecano",
 ("seriea","como"):"fl_como-1907", ("seriea","frosinone"):"bc_frosinone-calcio",
 ("seriea","monza"):"bc_a-c-monza", ("seriea","venezia"):"bc_venezia-f-c",
 ("bundesliga","werder_bremen"):"bc_werder-bremen", ("bundesliga","hamburg"):"bc_hamburger-sv",
 ("bundesliga","schalke"):"bc_fc-schalke-04",
 ("ligue1","auxerre"):"bc_aj-auxerre", ("ligue1","le_havre"):"bc_le-havre-ac",
 ("ligue1","paris_fc"):"bc_paris-fc", ("ligue1","toulouse"):"bc_toulouse-fc",
 ("mls","san_diego"):"bc_san-diego-fc", ("mls","st_louis_city"):"bc_st-louis-city-soccer-club",
}

# encycolorpedia "Logo Colors" scrapes for malaga / paderborn
def ec_logo(path):
    import os
    from bs4 import BeautifulSoup
    if not os.path.exists(path): return None
    h = open(path, encoding='utf-8', errors='replace').read()
    h = re.sub(r'<script.*?</script>', '', h, flags=re.S)
    h = re.sub(r'<style.*?</style>', '', h, flags=re.S)
    t = re.sub(r'\n{2,}', '\n', BeautifulSoup(h, 'lxml').get_text('\n', strip=True))
    i, j = t.find('Logo Colors'), t.find('Team Colors')
    if i < 0: return None
    seg = t[i:j if j > i else i + 300]
    return [m.upper() for m in re.findall(r'#([0-9a-fA-F]{6})', seg)]

NAMED = {"#FFFFFF":"White","#FEFEFE":"White","#000000":"Black"}
def name_hex(h):
    if h in NAMED: return NAMED[h]
    r, g, b = int(h[1:3],16), int(h[3:5],16), int(h[5:7],16)
    mx, mn = max(r,g,b), min(r,g,b)
    v, s = mx/255, 0 if mx == 0 else (mx-mn)/mx
    if s < .12: return "White" if v > .85 else "Black" if v < .18 else "Grey"
    hue = 0
    if mx == r: hue = (60*((g-b)/(mx-mn))) % 360
    elif mx == g: hue = 60*((b-r)/(mx-mn))+120
    else: hue = 60*((r-g)/(mx-mn))+240
    base = ("Red" if hue<15 or hue>=345 else "Orange" if hue<40 else "Gold" if hue<65 else
            "Green" if hue<160 else "Teal" if hue<190 else "Blue" if hue<255 else
            "Purple" if hue<290 else "Pink" if hue<345 else "Red")
    pre = "Dark " if v < .45 else "Light " if v > .85 and s < .45 else ""
    return pre + base

for k in (("laliga","malaga"), ("bundesliga","paderborn")):
    hexes = ec_logo(f"alt/ec_{k[1]}.html")
    if hexes:
        MANUAL[k] = ([[name_hex('#'+x), '#'+x] for x in dict.fromkeys(hexes)], MANUAL[k][1])

# --------------------------------------------------------------------------
out, prov, missing = {}, {}, []
ALL = dict(roster.LEAGUES); ALL.update(us_roster.US)
for lg, teams in ALL.items():
    out[lg] = {}
    for key, (name, slug) in teams.items():
        src = None
        if (lg, key) in MANUAL and MANUAL[(lg, key)][0]:
            cols, src = MANUAL[(lg, key)]
        elif (lg, key) in ALT_MAP:
            cols = alt[ALT_MAP[(lg, key)]]
            src = "brandcolorcode.com" if ALT_MAP[(lg,key)].startswith('bc_') else "footylogos.com"
        elif slug and parsed.get(slug, {}).get('colors'):
            cols = parsed[slug]['colors']; src = "teamcolorcodes.com"
        else:
            missing.append((lg, key, name)); continue
        out[lg][key] = {"name": ascii_(name), "colors": clean(cols)}
        prov[f"{lg}/{key}"] = src

json.dump(out, open('current.json','w'), indent=1)
json.dump(prov, open('provenance.json','w'), indent=1)
print("leagues:", {k: len(v) for k, v in out.items()})
print("total:", sum(len(v) for v in out.values()), "missing:", missing)
from collections import Counter
print(Counter(prov.values()))
