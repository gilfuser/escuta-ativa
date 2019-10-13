add_library('oscP5') # precisa instalar no IDE do Processing oscP5!


def setup():
    global x, y, z, oscP5, myRemoteLocation
    x, y, z = 0, 0, 0
    size(400, 400)
    frameRate(25)
    # start oscP5, listening for incoming messages at port 12000 """"
    oscP5 = OscP5(this, 12000)
    oscP5.plug(this,"test","/test");
    # myRemoteLocation = NetAddress("192.168.0.4", 57120)

def draw():
    background(0)
    # translate(width / 2, height / 2)
    rect(x, height / 2, x, 100) 

def oscEvent(theOscMessage):
    global x, y, z
    if theOscMessage.addrPattern() == "/test":
        x = theOscMessage.get(0).intValue()
        y = theOscMessage.get(1).intValue()
        z = theOscMessage.get(2).intValue()
        print(x, y, z)
