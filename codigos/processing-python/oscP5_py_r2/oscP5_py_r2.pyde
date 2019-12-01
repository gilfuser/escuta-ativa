add_library('oscP5') # precisa instalar no IDE do Processing oscP5!

ins, tom, amp, amo = 100, 100, 100, 0

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
    global ins, tom, amp, amo
    for instrumento in instrumentos:    
        if theOscMessage.addrPattern() == "/{}tom".format(instrumento):
            tom = theOscMessage.get(0).intValue()
        if theOscMessage.addrPattern() == "/{}amp".format(instrumento):
            amp = theOscMessage.get(0).intValue()
        if theOscMessage.addrPattern() == "/{}ins".format(instrumento):
            ins = theOscMessage.get(0).intValue()
        print(ins, tom, amp)
