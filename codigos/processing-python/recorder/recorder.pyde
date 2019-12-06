"""
Prova de conceito
"""
from estrela import Estrela
add_library('oscP5')  # precisa instalar no IDE do Processing oscP5!

# definie instrumentos que vão ser ouvidos
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
FULL_SCREEN = False

def setup():
    """ Define área de desenho e popula lista de estrelas """
    global dados, instrumentos, oscP5, novos_dados, estrelas
    size(600, 800)
    # fullScreen()
    background(0)
    # inicializa OSC
    oscP5 = OscP5(this, 12000)
    # sorteio inicial de teste e inicialização
    novos_dados = sorteio_dados()
    dados = sorteio_dados()
    print instrumentos
    # cria uma estrela pra cada instrumento
    estrelas = []  # lista de objetos
    for _ in instrumentos:
        e = Estrela(random(width), random(height))
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
        estrela.desenha(ins, cor, amp, FULL_SCREEN)
        estrela.anda(tom)

    for instrumento in instrumentos:
        ___, tom, amp, cor = dados[instrumento]
        nins, ntom, namp, ncor = novos_dados[instrumento]
        dados[instrumento] = (nins,
                              lerp(tom, ntom, .2),
                              # namp + random(-10, 10), # com easing: (amp +
                              # namp) / 2,
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
            save_dados((instrumento, ins, tom, amp, cor))

def save_dados(dados):
    import csv   
    with open(r'grava.csv', 'a') as f:
        writer = csv.writer(f)
        writer.writerow(dados)

def sorteio_dados():
    dados = dict()
    for instrumento in instrumentos:
        dados[instrumento] = (
            0,
            int(random(-24, 24)),
            int(random(10, 150)),
            int(random(360)))
    return dados

def keyPressed():
    if keyCode == SHIFT:
        for instrumento in instrumentos:
            ins, tom, amp, cor = novos_dados[instrumento]
            save_dados((instrumento, ins, tom, amp, cor))
