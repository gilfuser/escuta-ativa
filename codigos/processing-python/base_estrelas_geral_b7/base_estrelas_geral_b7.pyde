"""
Com Boids!
"""
from estrela import Estrela
add_library('oscP5')  # precisa instalar no IDE do Processing oscP5!

ins_override = -1  # -1 é o "normal" sem override
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
# True para tela inteira e giro 90 graus da animação
Estrela.full_screen = False

from boid import Boid
from flock import Flock

flock = Flock()

def settings():
    size(800, 600)

def setup():
    """ Define área de desenho e popula lista de estrelas """
    global dados, instrumentos, oscP5, novos_dados, estrelas
    # fullScreen(1)  # testar se 1 vai para segundo monitor
    this.surface.setResizable(True)
    if not Estrela.full_screen:
        this.surface.setSize(600, 800)
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
        e = Estrela(0, i * height / (len(instrumentos) - 2.2))
        estrelas.append(e)
    for i in range(18):
        flock.addBoid(Boid(width / 2, height / 2))

def draw():
    """ Limpa a tela, desenha e atualiza estrelas """
    # background(0)  # fundo preto OU
    # apagamento parcial para "rastro":
    fill(0, 10)
    noStroke()
    rect(0, 0, width, height)
    if ins_override == 6:
        flock.run()
    else:
        for i, estrela in enumerate(estrelas):
            ins, tom, amp, cor = dados[instrumentos[i]]
            estrela.desenha(ins, cor, amp)
            estrela.anda(tom)

    for i, instrumento in enumerate(instrumentos):
        ___, tom, amp, cor = dados[instrumento]
        nins, ntom, namp, ncor = novos_dados[instrumento]
        if ins_override >= 0:
            nins = ins_override
        dados[instrumento] = (nins,                  # ins/modo/ins_override
                              lerp(tom, ntom, .2),  # easing "suave"
                              namp,                # sem easing
                              # cor, #(cor + ncor) / 2   # easing "rápido"
                              360 * noise(i + frameCount * .02)
                              )
def mock_final(i):
    cor = 360 * noise(i * 100 + frameCount * .02)
    tom = -34 + 36 * noise(i * 200 + frameCount * .001)
    amp = 100 * noise(i * 300 + frameCount * .02)
    return cor, tom, amp


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
    if str(key) in "01234567":
        ins_override = int(key)
        Estrela.ins_override = int(key)
        print(ins_override)
    if key == ' ':
        ins_override = -1
    if keyCode == SHIFT:
        for instrumento in instrumentos:
            print(instrumento, novos_dados[instrumento])
    if key == 'f':
        Estrela.full_screen = not Estrela.full_screen
        if Estrela.full_screen:
            this.surface.setSize(displayWidth, displayHeight)
            this.surface.setLocation(0, 0)
        else:
            this.surface.setSize(600, 800)

def mouseDragged():
    this.surface.setLocation(mouseX, mouseY)
