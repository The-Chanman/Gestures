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
int pwm = 0;    // how bright the linear actuator is
int changeAmount = 5;    // how many points to fade the linear actuator by

// the setup routine runs once when you press reset:
void setup() {
  // declare pin 9 to be an output:
  pinMode(lActuator, OUTPUT);
}

// the loop routine runs over and over again forever:
void loop() {
  // set the pwm of pin 9:
  analogWrite(lActuator, pwm);

  // change the pwm for next time through the loop:
  pwm = pwm + changeAmount;

  // reverse the direction of the fading at the ends of the fade:
  if (pwm <= 0 || pwm >= 400) {
    changeAmount = -changeAmount;
  }

  // tell me what the pwm is
  Serial.println(pwm);
  // wait for 30 milliseconds to see the dimming effect
  delay(60);
}
