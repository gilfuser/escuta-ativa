# -*- coding: utf-8 -*-
# The Boid class
class Boid(object):

    def __init__(self, x, y):
        self.acceleration = PVector(0, 0)
        self.angle = random(TWO_PI)
        self.velocity = PVector(cos(self.angle), sin(self.angle))
        self.location = PVector(x, y)
        self.r = 2.0
        self.maxspeed = 2
        self.maxforce = 0.03

    def run(self, boids):
        self.flock(boids)
        self.update()
        self.borders()
        self.render()

    def applyForce(self, force):
        # We could add mass here if we want A = F / M
        self.acceleration.add(force)

    # We accumulate acceleration each time based on three rules.
    def flock(self, boids):
        sep = self.separate(boids)  # Separation
        ali = self.align(boids)  # Alignment
        coh = self.cohesion(boids)  # Cohesion
        # Arbitrarily weight these forces.
        sep.mult(1.5)
        ali.mult(1.0)
        coh.mult(1.0)
        # Add the force vectors to acceleration.
        self.applyForce(sep)
        self.applyForce(ali)
        self.applyForce(coh)

    # Method to update location.
    def update(self):
        # Update velocity.
        self.velocity.add(self.acceleration)
        # Limit speed.
        self.velocity.limit(self.maxspeed)
        self.location.add(self.velocity)
        # Reset accelertion to 0 each cycle.
        self.acceleration.mult(0)

    # A method that calculates and applies a steering force towards a target.
    # STEER = DESIRED MINUS VELOCITY
    def seek(self, target):
        # A vector pointing from the location to the target.
        desired = PVector.sub(target, self.location)
        # Scale to maximum speed.
        desired.normalize()
        desired.mult(self.maxspeed)
        # Above two lines of code below could be condensed with PVector setMag() method.
        # Not using this method until Processing.js catches up.
        # desired.setMag(maxspeed)
        # Steering = Desired minus Velocity
        steer = PVector.sub(desired, self.velocity)
        steer.limit(self.maxforce)  # Limit to maximum steering force.
        return steer

    def render(self):
        # Draw a triangle rotated in the direction of velocity.
        theta = self.velocity.heading2D() + radians(90)
        # heading2D() above is now heading() but leaving old syntax until
        # Processing.js catches up.
        noFill()
        stroke(255)
        strokeWeight(.1)
        estrela(self.location.x, self.location.y, 
                10, 40, 80)


    # Wraparound
    def borders(self):
        if self.location.x < -self.r:
            self.location.x = width + self.r
        if self.location.y < -self.r:
            self.location.y = height + self.r
        if self.location.x > width + self.r:
            self.location.x = -self.r
        if self.location.y > height + self.r:
            self.location.y = -self.r

    # Separation
    # Method checks for nearby boids and steers away.
    def separate(self, boids):
        desiredseparation = 50.0
        steer = PVector(0, 0, 0)
        count = 0
        # For every boid in the system, check if it's too close.
        for other in boids:
            d = PVector.dist(self.location, other.location)
            # If the distance is greater than 0 and less than an arbitrary
            # amount (0 when you are yourself).
            if 0 < d < desiredseparation:
                # Calculate vector pointing away from neighbor.
                diff = PVector.sub(self.location, other.location)
                diff.normalize()
                diff.div(d)  # Weight by distance.
                steer.add(diff)
                count += 1  # Keep track of how many
        # Average -- divide by how many
        if count == 0:
            return PVector(0, 0)
        if count > 0:
            steer.div(float(count))
        # As long as the vector is greater than 0
        if steer.mag() > 0:
            # First two lines of code below could be condensed with PVector setMag() method.
            # Implement Reynolds: Steering = Desired - Velocity
            steer.normalize()
            steer.mult(self.maxspeed)
            steer.sub(self.velocity)
            steer.limit(self.maxforce)
        return steer

    # Alignment
    # For every nearby boid in the system, calculate the average velocity.
    def align(self, boids):
        neighbordist = 50
        sum = PVector(0, 0)
        count = 0
        for other in boids:
            d = PVector.dist(self.location, other.location)
            if 0 < d < neighbordist:
                sum.add(other.velocity)
                count += 1
        if count == 0:
            return PVector(0, 0)
        sum.div(float(count))
        # First two lines of code below could be condensed with PVector setMag() method.
        # Implement Reynolds: Steering = Desired - Velocity
        sum.normalize()
        sum.mult(self.maxspeed)
        steer = PVector.sub(sum, self.velocity)
        steer.limit(self.maxforce)
        return steer

    # Cohesion
    # For the average location (i.e. center) of all nearby boids, calculate
    # steering vector towards that location.
    def cohesion(self, boids):
        neighbordist = 50
        # Start with empty vector to accumulate all locations.
        sum = PVector(0, 0)
        count = 0
        for other in boids:
            d = PVector.dist(self.location, other.location)
            if 0 < d < neighbordist:
                sum.add(other.location)  # Add location.
                count += 1
        if count > 0:
            sum.div(count)
            return self.seek(sum)  # Steer towards the location.
        else:
            return PVector(0, 0)


def estrela(cx, cy, pontas, raio1, raio2):
    pontos = pontas * 2
    parte = 360. / pontos
    beginShape()  # comece a forma!
    for p in range(pontos):  # para cada p
        angulo = radians(p * parte)  # calcula angulo
        if p % 2 == 0:  # se for par
            raio = raio1
        else:  # senão, se for impar
            raio = raio2
        x = cx + raio * sin(angulo)
        y = cy + raio * cos(angulo)
        vertex(x, y)  # vertex é um ponto
    endShape(CLOSE)  # termina forma
