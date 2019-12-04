"""
Vamos ler umas paradas
"""
from estrela import Estrela
add_library('oscP5')  # precisa instalar no IDE do Processing oscP5!

ins_override = -1  # -1 é o "normal" sem override
# definie instrumentos que vão ser ouvidos
instrumentos = (
    # "verdesol",
    "laranjare",
    # "verdefa1",
    # "verdefa2",
    # "vermelhodo1",
    # "vermelhodo2",
    "amarelomi",
    # "lilassi",
)
Estrela.FULL_SCREEN = False
# Estrela.FULL_SCREEN = True  # USAR JUNTO COM O fullScreen() no setup()

def setup():
    """ Define área de desenho e popula lista de estrelas """
    global dados, instrumentos, oscP5, novos_dados, estrelas
    
    size(600, 800)
    # fullScreen(0) # USAR COM Estrela.FULL_SCREEN = True
    background(0)
    
    # inicializa OSC
    oscP5 = OscP5(this, 12000)
    # inicialização das estruturas de dados
    novos_dados = setup_dados()
    dados = setup_dados()
    print instrumentos
    # cria uma estrela pra cada instrumento
    estrelas = []  # lista de objetos
    for i, _ in enumerate(instrumentos):
        e = Estrela(0, i * height / len(instrumentos))
        estrelas.append(e)

def draw():
    """ Limpa a tela, desenha e atualiza estrelas """
    # background(0)  # atualização do desenho, fundo preto
    # OU
    fill(0, 10)
    noStroke()
    rect(0, 0, width, height)

    for i, estrela in enumerate(estrelas):
        ins, tom, amp, cor = dados[instrumentos[i]]
        estrela.desenha(ins, cor, amp)
        estrela.anda(tom)

    for instrumento in instrumentos:
        ___, tom, amp, cor = dados[instrumento]
        nins, ntom, namp, ncor = novos_dados[instrumento]
        if ins_override >= 0:
            nins = ins_override
        dados[instrumento] = (nins,                  # ins/modo/ins_override
                              lerp(tom, ntom, .2),  # easing "suave"
                              namp,                # sem easing
                              (cor + ncor) / 2   # easing "rápido"
                              )

def oscEvent(oscMessage):
    for instrumento in instrumentos:
        if oscMessage and oscMessage.addrPattern() == "/" + instrumento:
            ins = oscMessage.get(0).intValue() if oscMessage.get(0) else 0
            tom = oscMessage.get(1).intValue() if oscMessage.get(1) else 0
            amp = oscMessage.get(2).intValue() if oscMessage.get(2) else 0
            cor = oscMessage.get(3).intValue() if oscMessage.get(3) else 0
            novos_dados[instrumento] = (ins, tom, amp, cor)

def setup_dados():
    dados = dict()
    for instrumento in instrumentos:
        dados[instrumento] = (
            0,  # ins/modo/ins_override
            0,  # int(random(-24, 24)),
            100,  # int(random(10, 150)),
            0,  # int(random(360)),
        )
    return dados

def keyPressed():
    global ins_override
    if str(key) in "0123456":
        ins_override = int(key)
        print(ins_override)
    if key == ' ':
        ins_override = -1
    if keyCode == SHIFT:
        for instrumento in instrumentos:
            print(instrumento, novos_dados[instrumento])
