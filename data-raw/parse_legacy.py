"""Parse the v1.0.1 palettes straight out of the original R sources.

Reads them from git rather than the working tree, since the working tree now holds the
rewritten 1.1.0 sources. `legacy.json` is the committed output of this script.
"""
import re, json, subprocess

REF = "d382ff5"   # last commit before the 1.1.0 rewrite

def read(fn):
    return subprocess.run(["git", "show", f"{REF}:R/{fn}"],
                          capture_output=True, text=True, check=True).stdout
out = {}
for fn, lg in [("eplcolors.r","epl"),("mlbcolors.r","mlb"),("nbacolors.r","nba"),
               ("nflcolors.r","nfl"),("nhlcolors.r","nhl")]:
    txt = read(fn)
    body = txt[txt.index('# Credit to'):]
    body = body[:body.index('switch(match.arg')]
    pal = {}
    for m in re.finditer(r'^\s{2}([A-Za-z_][A-Za-z0-9_]*)\s*=\s*c\((.*?)\)\s*$', body, flags=re.S | re.M):
        key, blob = m.group(1), m.group(2)
        pairs = re.findall(r'"([^"]+)"\s*=\s*"(#[0-9A-Fa-f]{6})"', blob)
        if pairs:
            pal[key] = [[n, h.upper()] for n, h in pairs]
            continue
        bare = re.findall(r'(?<![=]\s)"(#[0-9A-Fa-f]{6})"', blob)
        if bare:                      # v1.0.1 left a few entries unnamed
            pal[key] = [["", h.upper()] for h in bare]
    out[lg] = pal
    print(lg, len(pal))
# the original mlbcolors.r defines the Diamondbacks under a misspelled name
if 'diamonbacks' in out['mlb']:
    out['mlb']['diamondbacks'] = out['mlb'].pop('diamonbacks')
json.dump(out, open('legacy.json','w'), indent=1)
print("mlb diamondbacks ->", out['mlb'].get('diamondbacks'))
