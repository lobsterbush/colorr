import re, glob, json, os
from bs4 import BeautifulSoup

def clean(fn):
    h = open(fn, encoding='utf-8', errors='replace').read()
    h = re.sub(r'<script.*?</script>', '', h, flags=re.S)
    h = re.sub(r'<style.*?</style>', '', h, flags=re.S)
    return re.sub(r'\n{2,}', '\n', BeautifulSoup(h, 'lxml').get_text('\n', strip=True))

def parse_bc(fn):
    t = clean(fn)
    out = []
    # pattern: <Name>\ndownload\n<Team>'s <Name> color\nHex code\n#XXXXXX
    for m in re.finditer(r"\n([A-Za-z][A-Za-z0-9 /'&-]{1,28})\ndownload\n[^\n]*?'s .*? color\nHex code\n(#[0-9A-Fa-f]{6})", t):
        out.append((m.group(1).strip(), m.group(2).upper()))
    return out

def parse_fl(fn):
    t = clean(fn)
    out = []
    pat = "\n([A-Za-z][A-Za-z0-9 /'&-]{1,28})\n[^\n]{0,60}logo color\nHEX\n(#[0-9A-Fa-f]{6})"
    for m in re.finditer(pat, t):
        out.append((m.group(1).strip(), m.group(2).upper()))
    return out

res = {}
for fn in sorted(glob.glob('alt/*.html')):
    b = os.path.basename(fn)[:-5]
    cols = parse_bc(fn) if b.startswith('bc_') else parse_fl(fn)
    seen, ded = set(), []
    for n, h in cols:
        if h in seen: continue
        seen.add(h); ded.append((n, h))
    res[b] = ded
    print(f"{b}: {ded}")
json.dump(res, open('alt_parsed.json','w'), indent=1)
