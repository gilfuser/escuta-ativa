"""
Flocking 
by Daniel Shiffman.    

An implementation of Craig Reynold's Boids program to simulate
the flocking behavior of birds. Each boid steers itself based on 
rules of avoidance, alignment, and coherence.

Click the mouse to add a boid.
"""

from boid import Boid
from flock import Flock

flock = Flock()

def setup():
    size(800, 600)
    background(0)
    # Add an initial set of boids into the system
    for i in range(18):
        flock.addBoid(Boid(width / 2, height / 2))


def draw():
    scale(10)
    fill(0, 10)
    noStroke()
    rect(0, 0, width, height)

    flock.run()

# Add a boid into the System
def mousePressed():
    flock.addBoid(Boid(mouseX, mouseY))
