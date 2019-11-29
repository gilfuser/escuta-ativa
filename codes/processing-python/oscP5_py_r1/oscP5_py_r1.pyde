add_library('oscP5') # precisa instalar no IDE do Processing oscP5!

ins, tom, amp, amo = 0, 0, 0, 0

def setup():
    global x, y, z, oscP5
    size(400, 400)
    frameRate(25)
    oscP5 = OscP5(this, 12000)

def draw():
    background(0)
    translate(width / 2, height / 2)
    rect(0, 0, ins, tom) 
    ellipse(0, 0, amp, amo) 
    
def oscEvent(theOscMessage):
    global ins, tom, amp, amo
    if theOscMessage.addrPattern() == "/verdesol":
        ins = theOscMessage.get(0).intValue()
        tom = theOscMessage.get(1).intValue()
        amp = theOscMessage.get(2).intValue()
        amo = theOscMessage.get(3).intValue()
        print(ins, tom, amp, amo)
