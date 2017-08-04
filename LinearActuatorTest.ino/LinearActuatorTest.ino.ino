/*
 Fade

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
int power = 7;
int pwm = 150;    // how bright the linear actuator is
int powerState = HIGH;    // how much power its getting
int changeAmount = 5;    // how many points to fade the linear actuator by

// the setup routine runs once when you press reset:
void setup() {
  // declare pin 9 to be an output:
  pinMode(lActuator, OUTPUT);
  pinMode(power, OUTPUT);
  Serial.begin(9600);
}

// the loop routine runs over and over again forever:
void loop() {
  // tell me what the pwm is
  Serial.println(changeAmount);
  
  digitalWrite(power, LOW);

  // set the pwm of pin 9:
  analogWrite(lActuator, pwm);


  changeAmount = changeAmount + 5;

  // wait for 30 milliseconds to see the dimming effect
  delay(60);
}

