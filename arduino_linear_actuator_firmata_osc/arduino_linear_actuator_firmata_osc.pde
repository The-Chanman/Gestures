
import oscP5.*;
import netP5.*;
import processing.serial.*;
import cc.arduino.*;

Arduino arduino;
OscP5 oscP5;
NetAddress myRemoteLocation;

int lActuator = 9; // pin for the linear actuator

void setup() {
  size(400,400);
  frameRate(25);

  // Prints out the available serial ports.
  println(Arduino.list());

  // Modify this line, by changing the "0" to the index of the serial
  // port corresponding to your Arduino board (as it appears in the list
  // printed by the line above).
  arduino = new Arduino(this, Arduino.list()[1], 57600);

  /* start oscP5, listening for incoming messages at port 12000 */
  oscP5 = new OscP5(this,12000);

  /* myRemoteLocation is a NetAddress. a NetAddress takes 2 parameters,
   * an ip address and a port number. myRemoteLocation is used as parameter in
   * oscP5.send() when sending osc packets to another computer, device,
   * application. usage see below. for testing purposes the listening port
   * and the port of the remote location address are the same, hence you will
   * send messages back to this sketch.
   */
  myRemoteLocation = new NetAddress("127.0.0.1",12000);

  /* osc plug service
   * osc messages with a specific address pattern can be automatically
   * forwarded to a specific method of an object. in this example
   * a message with address pattern /test will be forwarded to a method
   * test(). below the method test takes 2 arguments - 2 ints. therefore each
   * message with address pattern /test and typetag ii will be forwarded to
   * the method test(int theA, int theB)
   */
  // oscP5.plug(this,"test","/test");
  oscP5.plug(this,"fastExtend","/fastExtend");
  oscP5.plug(this,"slowExtend","/slowExtend");
  oscP5.plug(this,"fastRetract","/fastRetract");
  oscP5.plug(this,"slowRetract","/slowRetract");
  oscP5.plug(this,"tryNotToMove","/tryNotToMove");
}


public void test(int theA, int theB) {
  println("### plug event method. received a message /test.");
  println(" 2 ints received: "+theA+", "+theB);
}


void draw() {
  background(0);
}


void mousePressed() {
  /* createan osc message with address pattern /test */
  OscMessage myMessage = new OscMessage("/fastExtend");

  /* send the message */
  oscP5.send(myMessage, myRemoteLocation);
}

void fastExtend(){
  arduino.analogWrite(lActuator, 250);
}

void slowExtend(){
  arduino.analogWrite(lActuator, 200);
}

void fastRetract(){
  arduino.analogWrite(lActuator, 260);
}

void slowRetract(){
  arduino.analogWrite(lActuator, 180);
}

void tryNotToMove(){
  arduino.analogWrite(lActuator, 190);
}

/* incoming osc message are forwarded to the oscEvent method. */
void oscEvent(OscMessage theOscMessage) {
  /* with theOscMessage.isPlugged() you check if the osc message has already been
   * forwarded to a plugged method. if theOscMessage.isPlugged()==true, it has already
   * been forwared to another method in your sketch. theOscMessage.isPlugged() can
   * be used for double posting but is not required.
  */

  /* print the address pattern and the typetag of the received OscMessage */
  println("### received an osc message.");
  println("### addrpattern\t"+theOscMessage.addrPattern());
  println("### typetag\t"+theOscMessage.typetag());

}
