/*
 Gestures Linear Actuator

 This example shows how to fade an linear actuator on pin 9
 using the analogWrite() function.

 The analogWrite() function uses PWM, so if
 you want to change the pin you're using, be
 sure to use another PWM capable pin. On most
 Arduino, the PWM pins are identified with
 a "~" sign, like ~3, ~5, ~6, ~9, ~10 and ~11.

 This example code is in the public domain.
 */

int lActuator = 9;           // the PWM pin the linear actuator is attached to
int pwm = 0;    // how strong and which direction the linear actuator is
int changeAmount = 5;    // how many points to fade the linear actuator by
int mode = 0;

// the setup routine runs once when you press reset:
void setup() {
  // declare pin 9 to be an output:
  pinMode(lActuator, OUTPUT);
  Serial.begin(9600);
}

// the loop routine runs over and over again forever:
void loop() {
  Serial.println(mode%5);
  switch (mode%5) {
      case 0:
        slowOut();
        break;
      case 1:
        fastOut();
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
  mode++;

  // wait for 20 milliseconds to see the dimming effect
  delay(2000);
}

void fastOut(){
  analogWrite(lActuator, 250);
}

void slowOut(){
  analogWrite(lActuator, 200);
}

void fastIn(){
  analogWrite(lActuator, 260);
}

void slowIn(){
  analogWrite(lActuator, 180);
}

void tryNotToMove(){
  analogWrite(lActuator, 190);
}
