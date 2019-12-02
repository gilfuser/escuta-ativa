# -*- coding: utf-8 -*-
from cores import *

class Estrela():
    """ Classe Estrela, cor sorteada, tamanho sorteado por default """    
    
    def __init__(self, x, y, tam=100):
        self.x, self.y = x, y
        self.tamanho = tam
        self.vy = -3

    def desenha(self, ins, cor, amp, FULL_SCREEN=False):
        """ Desenha polígono em torno das coordenadas do objeto """
        raio1, raio2 = amp, amp / 4
        strokeWeight(5)
        colorMode(RGB)
        stroke(paleta(ins, cor))
        fill(paleta(ins, cor))
        strokeJoin(ROUND)
        if FULL_SCREEN:
            translate(width/2, height/2)
            rotate(HALF_PI)
            translate(-width/2, -height/2)
        self.tamanho = amp 
        if ins == 6:
            ins = int(random(6))
        if ins in (0, 1):    
            noFill()
            fill(0)
            estrela(self.x, self.y, 7, raio1, raio2)
        if ins in (2, 3):    
            noStroke()
            pushMatrix()
            translate(self.x, self.y)
            estrela(0, 0, 4, raio1, raio1/4)
            rotate(QUARTER_PI)
            estrela(0, 0, 4, raio1 * .7, raio1/4 * .7)
            popMatrix()
        if ins in (4, 5):  
            stroke(0)  
            pushMatrix()
            translate(self.x, self.y)
            rotate(radians(frameCount))
            estrela(0, 0, 10, raio1, 50)
            popMatrix() 
        if FULL_SCREEN:
            translate(width/2, height/2)
            rotate(-HALF_PI)
            translate(-width/2, -height/2)
    
    def anda(self, tom=None, w=600, h=800):
        """ atualiza a posição do objeto e devolve do lado oposto se sair """
        if tom is not None:
            self.x = map(tom, -24, 24, 1, w) 
        # self.x += self.vx
        self.vy = -3 * 40 / (tom + 40)
        self.y += self.vy
        metade = self.tamanho
        if self.x > w + metade:
            self.x = -metade
        if self.y > h + metade:
            self.y = -metade
        if self.x < -metade:
            self.x = w + metade
        if self.y < -metade:
            self.y = h + metade

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
    
