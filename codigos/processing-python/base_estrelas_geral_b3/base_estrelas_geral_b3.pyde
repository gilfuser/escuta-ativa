"""
Prova de conceito
"""

from estrela import Estrela
add_library('oscP5')  # precisa instalar no IDE do Processing oscP5!

estrelas = []  # lista de objetos
FULL_SCREEN = False

def settings():
    size(600, 800)

def setup():
    """ Define área de desenho e popula lista de estrelas """
    # fullScreen()
    # global FULL_SCREEN = True
    setup_dados()

    meia_largura, meia_altura = width / 2., height / 2.  # floats
    print instrumentos
    for _ in range(len(instrumentos)):
        e = Estrela(random(width), random(height))
        estrelas.append(e)
    print len(estrelas), len(instrumentos)

def draw():
    """ Limpa a tela, desenha e atualiza estrelas """
    background(0)  # atualização do desenho, fundo preto

    for i, estrela in enumerate(estrelas):
        ins, tom, amp, cor = dados[instrumentos[i]]
        estrela.desenha(ins, cor, amp, mousePressed)
        estrela.anda(tom)

    for instrumento in instrumentos:
        ___, tom, amp, cor = dados[instrumento]
        nins, ntom, namp, ncor = novos_dados[instrumento]
        dados[instrumento] = (nins,
                              (tom + ntom) / 2,
                              # sem easing | com easing: (amp + namp) / 2,
                              namp,
                              (cor + ncor) / 2)

def oscEvent(oscMessage):
    for instrumento in instrumentos:
        if oscMessage and oscMessage.addrPattern() == "/" + instrumento:
            ins = oscMessage.get(0).intValue() if oscMessage.get(0) else 0
            tom = oscMessage.get(1).intValue() if oscMessage.get(1) else 0
            amp = oscMessage.get(2).intValue() if oscMessage.get(2) else 0
            cor = oscMessage.get(3).intValue() if oscMessage.get(3) else 0
            novos_dados[instrumento] = (ins, tom, amp, cor)

def setup_dados():
    global dados, instrumentos, oscP5, novos_dados
    oscP5 = OscP5(this, 12000)
    instrumentos = (
        "verdesol",
        "laranjare",
        "verdefa1",
        # "verdefa2",
        "vermelhodo1",
        # "vermelhodo2",
        "amarelomi",
        "lilassi",
    )
    dados = dict()
    novos_dados = dict()
    # sorteio inicial de teste e inicialização
    sorteio_dados()
    for instrumento in instrumentos:
        dados[instrumento] = (0,
                              int(random(-24, 24)),
                              int(random(10, 250)),
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
            int(random(10, 250)),
            int(random(360)))
