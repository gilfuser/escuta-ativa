
coresC = [(224, 0, 255), (255, 245, 0), (0, 255, 241),
          (255, 0, 95), (255, 250, 0), (255, 255, 255), ]
coresB = [(0, 255, 77), (109, 0, 255), (255, 0, 255),
          (0, 255, 255), (255, 0, 71), (253, 255, 0)]
coresA = [(255, 82, 0), (255, 247, 0), (0, 238, 255),
          (79, 0, 255), (0, 255, 249), (255, 255, 255)]

def setup():
    size(360, 360)
    
def draw():
    c0, c1, c2 = coresA[3], coresA[4], coresA[5]
    fill(*triangulo(c0, c1, c2, mouseX))
    circle(180, 180, 360)
    
def lerpC(r0, g0, b0, r1, g1, b1, t):
    r = lerp(r0, r1, t)
    g = lerp(g0, g1, t)
    b = lerp(b0, b1, t)
    return (r, g, b)
    
def triangulo(a, b, c, v):
    ra, ga, ba = a
    rb, gb, bv = b
    rc, gc, bc = c

    if 0 <= v < 60 or v == 360:
        return a
    if 60 <= v < 120:
        t = map(v, 60, 120, 0, 1)
        return lerpC(ra, ga, ba, rb, gb, bv, t)
    if 120 <= v < 180:
        return b
    if 180 <= v < 240:
        t = map(v, 180, 240, 0, 1)
        return lerpC(rb, gb, bv, rc, gc, bc, t)
    if 240 <= v < 300:
        return c
    if 300 <= v < 360:
        t = map(v, 300, 360, 0, 1)
        return lerpC(rc, gc, bc, ra, ga, ba, t)
        
    
    
    # novas = []
    # for c in coresC:
    #     colorMode(RGB)
    #     rgb = color(*c)
    #     colorMode(HSB)
    #     cor = color(hue(rgb), 255, 255)
    #     novas.append((red(cor), green(cor), blue(cor)))
    # print(novas)
    # for i, rgb in enumerate(coresC):
    #     colorMode(RGB)
    #     c = color(*rgb)
    #     fill(c)
    #     rect(0, i * 100, 100, 100)
