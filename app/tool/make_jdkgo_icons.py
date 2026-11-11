#!/usr/bin/env python3
"""Generates the JDK-Go launcher icons from the masters in assets/brand/.

Run from app/:   python3 tool/make_jdkgo_icons.py   (needs Pillow)

  jdk-go-mark.png   glyph on the flat navy field (1254x1254)  -> foreground / monochrome / legacy
Writes mipmap-*/ic_launcher{,_round,_foreground}.png and drawable-nodpi/ic_launcher_jdkgo_mono.png.
"""
import base64, io, os
import numpy as np
from PIL import Image, ImageDraw

APP = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
RES = os.path.join(APP, 'android', 'app', 'src', 'main', 'res')
MARK = Image.open(os.path.join(APP, 'assets', 'brand', 'jdk-go-mark.png')).convert('RGB')
BG = MARK.getpixel((4, 4))  # flat navy


def glyph_rgba():
    """Recover the glyph as RGBA by keying out the flat background colour."""
    px = MARK.load()
    out = Image.new('RGBA', MARK.size)
    po = out.load()
    for y in range(MARK.height):
        for x in range(MARK.width):
            p = px[x, y]
            a = max((p[i] - BG[i]) / (255 - BG[i]) for i in range(3))
            a = min(1.0, max(0.0, a))
            if a < 0.02:
                po[x, y] = (0, 0, 0, 0)
            else:
                po[x, y] = tuple(min(255, max(0, round(BG[i] + (p[i] - BG[i]) / a))) for i in range(3)) + (round(a * 255),)
    return out


G = glyph_rgba()
BOX = G.getbbox()
G = G.crop(BOX)


def place(canvas_px, width_frac, src=None):
    """Glyph scaled to width_frac of the canvas, centred on its ink box."""
    src = src or G
    w = round(canvas_px * width_frac)
    h = round(src.height * w / src.width)
    g = src.resize((w, h), Image.LANCZOS)
    c = Image.new('RGBA', (canvas_px, canvas_px), (0, 0, 0, 0))
    c.alpha_composite(g, ((canvas_px - w) // 2, (canvas_px - h) // 2))
    return c


def save(img, *parts):
    p = os.path.join(RES, *parts)
    os.makedirs(os.path.dirname(p), exist_ok=True)
    img.save(p, optimize=True)


def legacy(px, shape, frac, bgfill=None, glyph=None):
    s = px * 4
    base = Image.new('RGBA', (s, s), (0, 0, 0, 0))
    m = Image.new('L', (s, s), 0)
    d = ImageDraw.Draw(m)
    if shape == 'round':
        d.ellipse((0, 0, s - 1, s - 1), fill=255)
    else:
        d.rounded_rectangle((0, 0, s - 1, s - 1), radius=round(s * 0.22), fill=255)
    base.paste(bgfill(s) if bgfill else Image.new('RGBA', (s, s), BG + (255,)), mask=m)
    base.alpha_composite(place(s, frac, glyph))
    return base.resize((px, px), Image.LANCZOS)



def white(img):
    """Opaque-white silhouette that keeps the glyph's alpha, shell highlights as alpha."""
    lum = img.convert('RGB').convert('L').point(lambda v: min(255, round(v * 1.15)))
    a = Image.composite(lum, Image.new('L', img.size, 0), img.getchannel('A').point(lambda a: 255 if a else 0))
    out = Image.new('RGBA', img.size, (255, 255, 255, 0))
    out.putalpha(a)
    return out


def diag(c0, c1):
    """The launcher's 108-grid diagonal gradient as a function of the canvas side."""
    def make(s):
        ys, xs = np.mgrid[0:s, 0:s].astype(float)
        x, y = xs / s * 108, ys / s * 108
        (x0, y0), (x1, y1) = (7.57, -5.87), (100.43, 113.87)
        t = np.clip(((x - x0) * (x1 - x0) + (y - y0) * (y1 - y0)) / ((x1 - x0) ** 2 + (y1 - y0) ** 2), 0, 1)[..., None]
        arr = np.array(c0) * (1 - t) + np.array(c1) * t
        return Image.fromarray(np.dstack([arr, np.full((s, s, 1), 255)]).astype('uint8'), 'RGBA')
    return make


# name -> (background gradient or None for the flat default, mono glyph?)
VARIANTS = {
    'ic_launcher': (None, False),
    'ic_launcher_night': (diag((0x2C, 0x3D, 0x6C), (0x0C, 0x12, 0x2D)), False),
    'ic_launcher_frost': (diag((0x3F, 0xB6, 0xFF), (0x1F, 0x4F, 0xD8)), False),
    'ic_launcher_ink': (diag((0x29, 0x2B, 0x30), (0x0D, 0x0E, 0x11)), True),
}
GM = white(G)
ADAPTIVE = {'mdpi': 108, 'hdpi': 162, 'xhdpi': 216, 'xxhdpi': 324, 'xxxhdpi': 432}
LEGACY = {'mdpi': 48, 'hdpi': 72, 'xhdpi': 96, 'xxhdpi': 144, 'xxxhdpi': 192}
for name, (bgf, mono_glyph) in VARIANTS.items():
    g = GM if mono_glyph else G
    for d, px in ADAPTIVE.items():
        save(place(px, 0.60, g), f'mipmap-{d}', f'{name}_foreground.png')
    for d, px in LEGACY.items():
        save(legacy(px, 'square', 0.74, bgf, g), f'mipmap-{d}', f'{name}.png')
        save(legacy(px, 'round', 0.66, bgf, g), f'mipmap-{d}', f'{name}_round.png')

# Themed (monochrome) layer + notification small icon.
save(place(432, 0.60, GM), 'drawable-nodpi', 'ic_launcher_jdkgo_mono.png')
for d, px in {'mdpi': 24, 'hdpi': 36, 'xhdpi': 48, 'xxhdpi': 72, 'xxxhdpi': 96}.items():
    save(place(px, 0.92, GM), f'drawable-{d}', 'ic_stat_dsh.png')

# In-app + site art.
BRAND = os.path.join(APP, 'assets', 'brand')
n = 512
gl = G.resize((n, round(G.height * n / G.width)), Image.LANCZOS)
gl.save(os.path.join(BRAND, 'jdk-go-glyph.png'), optimize=True)
tile = legacy(512, 'square', 0.74)
tile.save(os.path.join(BRAND, 'jdk-go-tile.png'), optimize=True)
buf = io.BytesIO(); legacy(256, 'square', 0.74).save(buf, 'PNG', optimize=True)
svg = ('<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 256 256">'
       '<image width="256" height="256" href="data:image/png;base64,%s"/></svg>\n') % base64.b64encode(buf.getvalue()).decode()
for out in (os.path.join(APP, '..', 'site', 'home', 'dist', 'assets', 'dsh-go.svg'), os.path.join(APP, '..', 'site', 'share', 'favicon.svg')):
    open(out, 'w').write(svg)
# Glyph measurements for BrandMark (alpha-weighted centroid of the cropped glyph).
a = np.array(G.getchannel('A')).astype(float)
ys, xs = np.mgrid[0:a.shape[0], 0:a.shape[1]]
print('aspect', G.width / G.height, 'centre', (a * xs).sum() / a.sum() / G.width, (a * ys).sum() / a.sum() / G.height)
print('background #%02X%02X%02X' % BG)
