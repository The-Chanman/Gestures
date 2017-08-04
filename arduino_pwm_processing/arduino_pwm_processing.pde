/*
arduino_pwm

Demonstrates the control of analog output (PWM) pins of an Arduino board
running the StandardFirmata firmware.  Moving the mouse horizontally across
the sketch changes the output on pins 9 (value is proportional to the mouse
X coordinate) and 11 (inversely porportional to mouse X).

To use:
* Using the Arduino software, upload the StandardFirmata example (located
  in Examples > Firmata > StandardFirmata) to your Arduino board.
* Run this sketch and look at the list of serial ports printed in the
  message area below. Note the index of the port corresponding to your
  Arduino board (the numbering starts at 0).  (Unless your Arduino board
  happens to be at index 0 in the list, the sketch probably won't work.
  Stop it and proceed with the instructions.)
* Modify the "arduino = new Arduino(...)" line below, changing the number
  in Arduino.list()[0] to the number corresponding to the serial port of
  your Arduino board.  Alternatively, you can replace Arduino.list()[0]
  with the name of the serial port, in double quotes, e.g. "COM5" on Windows
  or "/dev/tty.usbmodem621" on Mac.
* Connect LEDs or other outputs to pins 9 and 11.
* Run this sketch and move your mouse horizontally across the screen.

For more information, see: http://playground.arduino.cc/Interfacing/Processing
*/

import processing.serial.*;

import cc.arduino.*;

Arduino arduino;

int lActuator = 9; // pin for the linear actuator
int mode = 2; // intial is not moving

void setup() {
  size(360, 360);

  // Prints out the available serial ports.
  println(Arduino.list());

  // Modify this line, by changing the "0" to the index of the serial
  // port corresponding to your Arduino board (as it appears in the list
  // printed by the line above).
  arduino = new Arduino(this, Arduino.list()[1], 57600);

  // Alternatively, use the name of the serial port corresponding to your
  // Arduino (in double-quotes), as in the following line.
  //arduino = new Arduino(this, "/dev/tty.usbmodem621", 57600);
}

void draw() {
  // keep draw() here to continue looping while waiting for keys
}

void keyPressed(){
  // If the key is between 'A'(65) to 'Z' and 'a' to 'z'(122)
  if(key >= '1' && key <= '5') {
    int keyIndex;
    keyIndex = key-'1';
    println(keyIndex);
    switch (keyIndex) {
        case 0:
          fastOut();
          break;
        case 1:
          slowOut();
          break;
        case 2:
          tryNotToMove();
          break;
        case 3:
          slowIn();
          break;
        case 4:
          fastIn();
          break;
        default:
        // DO NOTHING
        break;
    }
  }
}

void fastOut(){
  arduino.analogWrite(lActuator, 250);
}

void slowOut(){
  arduino.analogWrite(lActuator, 200);
}

void fastIn(){
  arduino.analogWrite(lActuator, 260);
}

void slowIn(){
  arduino.analogWrite(lActuator, 180);
}

void tryNotToMove(){
  arduino.analogWrite(lActuator, 190);
}
