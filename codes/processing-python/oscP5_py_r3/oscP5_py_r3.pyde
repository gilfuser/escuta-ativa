add_library('oscP5') # precisa instalar no IDE do Processing oscP5!

ins, tom, amp, amo = 0, 100, 100, 0

dados = dict()
instrumentos = ("verdesol",
                "laranjare",
                "verdefa",
                "vermelhodo1",
                "vermelhodo2",
                "amarelosi",
                "roxomi"
                )

def setup():
    global x, y, z, oscP5
    size(400, 400)
    frameRate(25)
    oscP5 = OscP5(this, 12000)

def draw():
    background(0)
    translate(0, height / 2)
    if ins:
        circle(tom, 0, amp) 
    else:
        square(tom, height / 2, amp)
    
def oscEvent(theOscMessage):
    for instrumento in instrumentos:    
        t = "/{}tom".format(instrumento)
        if theOscMessage.addrPattern() == t:
            dados[t] = theOscMessage.get(0).intValue()
            print(t, dados[t])
        a = "/{}amp".format(instrumento)
        if theOscMessage.addrPattern() == a:
            dados[a] = theOscMessage.get(0).intValue()
            print(a, dados[a])
        i = "/{}ins".format(instrumento)
        if theOscMessage.addrPattern() == i:
            dados[i] = theOscMessage.get(0).intValue()
            print(i, dados[i])
