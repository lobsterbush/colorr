import json, re, glob, os
from bs4 import BeautifulSoup

def block_color(div):
    txt = div.get_text('\n', strip=True)
    lines = [l.strip() for l in txt.split('\n') if l.strip()]
    if not lines: return None
    name = re.sub(r'\s+', ' ', lines[0]).strip(' :')
    name = re.sub(r'\s*(PANTONE|Pantone).*$', '', name).strip()
    m = re.search(r'Hex\s*(?:Color|Code)?\s*:?\s*#?([0-9A-Fa-f]{6}|[0-9A-Fa-f]{3})\b', txt)
    if m:
        hexv = m.group(1)
    else:
        m2 = re.search(r'background-color:\s*#([0-9A-Fa-f]{6}|[0-9A-Fa-f]{3})\b', div.get('style',''))
        if m2: hexv = m2.group(1)
        elif 'white' in (div.get('class') or []): hexv = 'FFFFFF'
        else: return None
    if len(hexv) == 3:
        hexv = ''.join(ch * 2 for ch in hexv)
    if not name or len(name) > 40: return None
    return (name, '#' + hexv.upper())

HIST = re.compile(
    r'\((?![^)]*present)[^)]*\b(?:18|19|20)\d{2}\b'      # a closed year range
    r'|historic|retro|throwback|alternat|former|previous|\bold\b|\bpast\b'
    r'|city edition|classic edition|statement edition',
    re.I)

def parse(fn):
    raw = open(fn, encoding='utf-8', errors='replace').read()
    raw = re.sub(r'<style.*?</style>', '', raw, flags=re.S)
    raw = re.sub(r'<script.*?</script>', '', raw, flags=re.S)
    soup = BeautifulSoup(raw, 'lxml')
    h1 = soup.find('h1')
    title = h1.get_text(' ', strip=True) if h1 else ''
    ec = soup.select_one('div.entry-content') or soup
    team = re.sub(r'\s+(Color Codes|Colors)$', '', title, flags=re.I).strip()
    out = []
    for el in ec.find_all(['h1', 'h2', 'h3', 'h4', 'div'], recursive=True):
        cls = el.get('class') or []
        if el.name != 'div':
            # keep walking through the team's own sub-sections, stop at anything
            # describing a historical, throwback or alternate identity
            # defunct teams have nothing but historical sections, so only stop once
            # we already hold the palette that heads the page
            if out and HIST.search(el.get_text(' ', strip=True)):
                break
            continue
        if 'colorblock' not in cls:
            continue
        c = block_color(el)
        if c:
            nm = c[0]
            if team and nm.lower().startswith(team.lower() + ' '):
                nm = nm[len(team) + 1:].strip()   # "San Diego Padres Brown" -> "Brown"
            out.append((nm or c[0], c[1]))
    seen, res = set(), []
    for n, h in out:
        if h in seen: continue
        seen.add(h); res.append([n, h])
    return title, res

data = {}
for fn in sorted(glob.glob('pages/*.html')):
    s = os.path.basename(fn)[:-5]
    t, cols = parse(fn)
    data[s] = {'title': t, 'colors': cols}
json.dump(data, open('parsed.json','w'), indent=1)
ok = {k:v for k,v in data.items() if v['colors']}
import statistics
print("pages", len(data), "with colors", len(ok),
      "median", statistics.median(len(v['colors']) for v in ok.values()),
      "max", max(len(v['colors']) for v in ok.values()))
