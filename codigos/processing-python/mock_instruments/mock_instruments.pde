import oscP5.*;
import netP5.*;
import java.io.FileReader;

OscP5 oscP5;
NetAddress myRemoteLocation;

BufferedReader reader0;
BufferedReader reader1;

void setup() {
  reader0 = createReader("mi.csv") ;
  reader1 = createReader("re.csv") ;  
  /* start oscP5, listening for incoming messages at port 12000 */
  oscP5 = new OscP5(this, 12000);
  myRemoteLocation = new NetAddress("127.0.0.1", 12000); // 192.168.1.31 // 127.0.0.1
  // reduce rate
  frameRate(20); // IMPORTANTE!
}

void draw() {
  background(0);
  tryReader(reader0);
  tryReader(reader1);
}

void tryReader(BufferedReader reader) {  
  String line = null;
  try {
    if ((line = reader.readLine()) != null) {
      String[] pieces = split(line, ",");
      String device = pieces[0];
      int ins = int(pieces[1]);
      int tom = int(pieces[2]);
      int amp = int(pieces[3]);
      int cor = int(pieces[4]);
      sendOsc(device, ins, tom, amp, cor);
      println(device, ins, tom, amp, cor);
    }
  } 
  catch (IOException e) {
    e.printStackTrace();
  }
}

void stop() {
  try {
    reader0.close();
  } 
  catch (IOException e) {
    e.printStackTrace();
  }
}

void sendOsc(String device, int ins, int tom, int amp, int cor) {
  /* in the following different ways of creating osc messages are shown by example */
  OscMessage myMessage = new OscMessage("/"+device);
  myMessage.add(ins); //ins 0 to 5
  myMessage.add(tom); //tom -24 to 24
  myMessage.add(amp); //amp ?
  myMessage.add(cor); //cor 0 to 360
  // Manda!
  oscP5.send(myMessage, myRemoteLocation);
}
