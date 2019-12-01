"""
Prova de conceito
"""

from estrela import Estrela
add_library('oscP5')  # precisa instalar no IDE do Processing oscP5!

estrelas = []  # lista de objetos


def settings():
    size(600, 800)

def setup():
    global FULL_SCREEN
    FULL_SCREEN = False
    # uncomment next two lines
    # fullScreen()
    # FULL_SCREEN = True

    """ Define área de desenho e popula lista de estrelas """
    # if FULL_SCREEN:
    # else:
    # size(600, 800)  # área de desenho (width, height)
    setup_dados()

    meia_largura, meia_altura = width / 2., height / 2.  # floats
    print instrumentos
    for _ in range(len(instrumentos)):
        e = Estrela(random(width), random(height))
        estrelas.append(e)
    print len(estrelas), len(instrumentos)

def draw():
    # if FULL_SCREEN:
    #     global width, height
    #     translate(width / 2, height / 2)
    #     rotate(QUARTER_PI)
    #     translate(-width / 2, -height / 2)
    #     width, height = height, width
    """ Limpa a tela, desenha e atualiza estrelas """
    background(0)  # atualização do desenho, fundo preto

    for i, estrela in enumerate(estrelas):
        ins, tom, amp, cor = dados[instrumentos[i]]
        estrela.desenha(ins, cor, amp)
        estrela.anda(tom)

    for instrumento in instrumentos:
        # print(instrumento, dados[instrumento][-1], novos_dados[instrumento][-1])
        ___, tom, amp, cor = dados[instrumento]
        nins, ntom, namp, ncor = novos_dados[instrumento]
        dados[instrumento] = (nins,
                              (tom + ntom) / 2,
                              namp, # sem easing | com easing: (amp + namp) / 2,
                              (cor + ncor) / 2)


def oscEvent(theOscMessage):
    for instrumento in instrumentos:
        if theOscMessage and theOscMessage.addrPattern() == "/" + instrumento:
            ins = theOscMessage.get(
                0).intValue() if theOscMessage.get(0) else 0
            tom = theOscMessage.get(
                1).intValue() if theOscMessage.get(1) else 0
            amp = theOscMessage.get(
                2).intValue() if theOscMessage.get(2) else 0
            cor = theOscMessage.get(
                3).intValue() if theOscMessage.get(3) else 0
            novos_dados[instrumento] = (ins, tom, amp, cor)

def setup_dados():
    global dados, instrumentos, oscP5, novos_dados
    oscP5 = OscP5(this, 12000)
    instrumentos = (
        # "verdesol",
        # "laranjare",
        "verdefa1",
        # "verdefa2",
        # "vermelhodo1",
        # "vermelhodo2",
        # "amarelomi",
        "lilassi",
    )
    dados = dict()
    novos_dados = dict()
    sorteio_dados()
    for instrumento in instrumentos:
        dados[instrumento] = (0,
                              int(random(-24, 24)),
                              int(random(10, 1000)),
                              int(random(360)))

def keyPressed():
    if key == ' ':
        sorteio_dados()
    if keyCode == SHIFT:
        for instrumento in instrumentos:
            print(instrumento, novos_dados[instrumento])

def sorteio_dados():
    for instrumento in instrumentos:
        novos_dados[instrumento] = (
            0,
            int(random(-24, 24)),
            int(random(10, 1000)),
            int(random(360)))
