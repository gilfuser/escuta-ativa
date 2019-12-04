import oscP5.*;
import netP5.*;
import java.io.FileReader;

OscP5 oscP5;
NetAddress myRemoteLocation;

BufferedReader reader0;
BufferedReader reader1;

void setup() {
  setupReader();
  size(400, 400);
  frameRate(20);  // IMPORTANTE!
  /* start oscP5, listening for incoming messages at port 12000 */
  oscP5 = new OscP5(this, 12000);
  myRemoteLocation = new NetAddress("127.0.0.1", 12000); // 192.168.1.31 // 127.0.0.1
  // reduce rate
  frameRate(20);
}

void draw() {
  background(0);
  String line = null;
  try {
    if ((line = reader0.readLine()) != null) {
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
  //myMessage.add(12.34); /* add a float to the osc message */
  //myMessage.add("some text"); /* add a string to the osc message */
  //myMessage.add(new byte[] {0x00, 0x01, 0x10, 0x20}); /* add a byte blob to the osc message */
  //myMessage.add(new int[] {1,2,3,4}); /* add an int array to the osc message */

  /* send the message */
  oscP5.send(myMessage, myRemoteLocation);
}


///* incoming osc message are forwarded to the oscEvent method. */
//void oscEvent(OscMessage theOscMessage) {
//  /* print the address pattern and the typetag of the received OscMessage */
//  print("### received an osc message.");
//  print(" addrpattern: "+theOscMessage.addrPattern());
//  println(" typetag: "+theOscMessage.typetag());
//}

void setupReader() {
  println("--readfile--");
  reader0 = createReader("mi.csv") ;
  reader1 = createReader("re.csv") ;  //  while (true) {
  //    String lineIn = reader.readLine() ;
  //    if (lineIn==null) break;
  //    println(lineIn);
  //  }
  //}
}
