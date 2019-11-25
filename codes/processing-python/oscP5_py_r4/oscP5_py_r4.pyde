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
        tom = read_dados(instrumento, 0)
        amp = read_dados(instrumento, 1)
        cor = read_dados(instrumento, 2)
        ins = read_dados(instrumento, 3)
        colorMode(HSB)
        fill(cor % 255, 255, 255, 100)
        if ins:
            circle(tom, 0, amp) 
        else:
            square(tom, 0, amp)
        
def oscEvent(theOscMessage):
    for instrumento in instrumentos:   
        for tipo in tipos: 
            chave = tipo.format(instrumento)
            if theOscMessage.addrPattern() == chave:
                dados[chave] = theOscMessage.get(0).intValue()
                print(chave, dados[chave])
     
def read_dados(instrumento, num_tipo):
    chave = tipos[num_tipo].format(instrumento)
    return dados[chave]

def setup_dados():
    global dados, instrumentos, tipos, oscP5
    oscP5 = OscP5(this, 12000)
    dados = dict()
    instrumentos = ("verdesol",
                    "laranjare",
                    "verdefa",
                    "vermelhodo1",
                    "vermelhodo2",
                    "amarelosi",
                    "roxomi"
                    )
    tipos = ("/{}tom", "/{}amp", "/{}cor", "/{}ins")
    for tipo in tipos:
        for instrumento in instrumentos:
            chave = tipo.format(instrumento)
            dados[chave] = 100    
