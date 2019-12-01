# -*- coding: utf-8 -*-
from cores import *

class Estrela():
    """ Classe Estrela, cor sorteada, tamanho sorteado por default """    
    def __init__(self, px, py, ptamanho=None):
        self.x = px
        self.y = py
        if ptamanho:
            self.tamanho = ptamanho
        else:
            self.tamanho = random(50, 200)
        self.vx = random(-2,2)
        self.vy = random(-2,-4)


    def desenha(self, ins, cor, amp):
        """ Desenha polígono em torno das coordenadas do objeto """
        strokeWeight(5)
        colorMode(RGB)
        noStroke()
        stroke(paleta(ins, cor))
        strokeJoin(ROUND)

        if ins in (0, 1):    
            noFill()
            estrela(self.x, self.y, pontas=7, raio1=amp, raio2=amp * 2)
        if ins in (2, 3):    
            estrela(self.x, self.y, pontas=7, raio1=amp, raio2=amp * 2)
        if ins in (4, 5):    
           estrela(self.x, self.y, pontas=7, raio1=amp, raio2=amp * 2)    
        # self.tamanho -=  (self.tamanho + raio2 / 5)
        # estrela(self.x, self.y, pontas, raio1, raio2)
    
    def anda(self, tom=None):
        """ atualiza a posição do objeto e devolve do lado oposto se sair """
        if tom is not None:
            self.x = map(tom, -24, 24, 1, width) 
        self.x += self.vx
        self.y += self.vy
        metade = self.tamanho
        if self.x > width + metade:
            self.x = -metade
        if self.y > height + metade:
            self.y = -metade
        if self.x < -metade:
            self.x = width + metade
        if self.y < -metade:
            self.y = height + metade
            
            
def estrela(cx, cy, pontas, raio1, raio2):    
    pontos = pontas * 2
    parte = 360. / pontos
    beginShape() # comece a forma!
    for p in range(pontos): # para cada p
        angulo = radians(p * parte) # calcula angulo
        if p % 2 == 0: # se for par
            raio = raio1
        else: # senão, se for impar
            raio = raio2
        x = cx + raio * sin(angulo)
        y = cy + raio * cos(angulo)
        vertex(x, y) # vertex é um ponto
    endShape(CLOSE) # termina forma
    
