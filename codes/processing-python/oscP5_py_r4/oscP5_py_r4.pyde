add_library('oscP5') # precisa instalar no IDE do Processing oscP5!

    
def setup():
    global x, y, z, oscP5
    size(400, 400)
    frameRate(25)
    setup_dados()

def draw():
    background(0)
    translate(0, height / 2)
    for instrumento in instrumentos:
        tom, amp, cor, ins = dados[instrumento]
        colorMode(HSB)
        fill(cor % 255, 255, 255, 100)
        if ins:
            circle(tom, 0, amp) 
        else:
            square(tom, 0, amp)
        
def oscEvent(theOscMessage):
    # print theOscMessage
    for instrumento in instrumentos:   
            if theOscMessage and theOscMessage.addrPattern() == "/"+ instrumento:
                ins = theOscMessage.get(0).intValue() if theOscMessage.get(0) else 0
                tom = theOscMessage.get(1).intValue() if theOscMessage.get(1) else 0
                amp = theOscMessage.get(2).intValue() if theOscMessage.get(2) else 0
                cor = theOscMessage.get(3).intValue() if theOscMessage.get(3) else 0               
                dados[instrumento] = (ins, tom, amp, cor)
                # print(instrumento, dados[instrumento])
     
def setup_dados():
    global dados, instrumentos, oscP5
    oscP5 = OscP5(this, 12000)
    dados = dict()
    instrumentos = ("verdesol",
                    "laranjare",
                    "verdefa",
                    "vermelhodo1",
                    "vermelhodo2",
                    "amarelomi",
                    "roxosi"
                    )
    for instrumento in instrumentos:
            dados[instrumento] = (0, 100, 100, 100)
